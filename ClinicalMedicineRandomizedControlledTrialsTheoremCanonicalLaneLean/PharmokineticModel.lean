import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean

structure CompartmentModel where
  compartments : Nat
  volumeOfDistribution : ℝ
  clearanceRate : ℝ
  absorptionRate : ℝ
  concentrationCurve : ℝ → ℝ

def CompartmentModelClosed (M : CompartmentModel) : Prop :=
  M.volumeOfDistribution > 0 ∧ M.clearanceRate > 0 ∧ M.absorptionRate > 0

theorem compartment_model_bridge (M : CompartmentModel) (h : CompartmentModelClosed M) :
  MedicineWitnessClosed (AdmittedObject.mk M) := by
  unfold CompartmentModelClosed at h
  rcases h with ⟨hvol, hclear, habs⟩
  unfold MedicineWitnessClosed
  exact ⟨hvol, hclear, habs⟩

end ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean
end HautevilleHouse