import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean

structure SurvivalModel where
  hazardRate : ℝ → ℝ
  survivalFunction : ℝ → ℝ
  medianSurvivalTime : ℝ
  censoringIndicator : Bool

def SurvivalModelClosed (S : SurvivalModel) : Prop :=
  S.medianSurvivalTime > 0 ∧ S.survivalFunction 0 = 1 ∧ (∀ t, S.hazardRate t ≥ 0)

theorem survival_model_bridge (S : SurvivalModel) (h : SurvivalModelClosed S) :
  MedicineWitnessClosed (AdmittedObject.mk S) := by
  rcases h with ⟨h_median, h_surv, h_hazard⟩
  refine ⟨?_, ?_, ?_⟩
  · -- medianSurvivalTime > 0
    exact h_median
  · -- survivalFunction at 0 = 1
    exact h_surv
  · -- hazardRate nonnegative
    intro t
    exact h_hazard t

end ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean
end HautevilleHouse