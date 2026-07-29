import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean

structure DiagnosticTest where
  sensitivity : ℝ
  specificity : ℝ
  prevalence : ℝ
  positivePredictiveValue : ℝ
  negativePredictiveValue : ℝ

def DiagnosticTestClosed (T : DiagnosticTest) : Prop :=
  0 < T.sensitivity ∧ T.sensitivity ≤ 1 ∧ 0 < T.specificity ∧ T.specificity ≤ 1 ∧
  0 < T.prevalence ∧ T.prevalence < 1 ∧ T.positivePredictiveValue > 0 ∧ T.negativePredictiveValue > 0

theorem diagnostic_test_bridge (T : DiagnosticTest) (h : DiagnosticTestClosed T) :
  MedicineWitnessClosed (AdmittedObject.mk T) := by
  unfold MedicineWitnessClosed
  apply And.intro
  · exact And.intro (by
      have hpos : 0 < T.sensitivity := by
        rcases h with ⟨h_s, _, _, _, _, _, _, _⟩
        exact h_s
      exact hpos) (by
      have hle : T.sensitivity ≤ 1 := by
        rcases h with ⟨_, h_sle, _, _, _, _, _, _⟩
        exact h_sle
      exact hle)
  · apply And.intro
    · exact And.intro (by
        have hpos : 0 < T.specificity := by
          rcases h with ⟨_, _, h_sp, _, _, _, _, _⟩
          exact h_sp
        exact hpos) (by
        have hle : T.specificity ≤ 1 := by
          rcases h with ⟨_, _, _, h_sple, _, _, _, _⟩
          exact h_sple
        exact hle)
    · apply And.intro
      · exact And.intro (by
          have hpos : 0 < T.prevalence := by
            rcases h with ⟨_, _, _, _, h_p, _, _, _⟩
            exact h_p
          exact hpos) (by
          have hlt : T.prevalence < 1 := by
            rcases h with ⟨_, _, _, _, _, h_plt, _, _⟩
            exact h_plt
          exact hlt)
      · apply And.intro
        · exact by
          rcases h with ⟨_, _, _, _, _, _, h_ppv, _⟩
          exact h_ppv
        · exact by
          rcases h with ⟨_, _, _, _, _, _, _, h_npv⟩
          exact h_npv

end ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean
end HautevilleHouse