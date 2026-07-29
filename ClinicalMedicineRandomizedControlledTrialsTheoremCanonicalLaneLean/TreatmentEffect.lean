import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean

structure TreatmentEffect where
  meanDifference : ℝ
  confidenceIntervalLower : ℝ
  confidenceIntervalUpper : ℝ
  pValue : ℝ

structure TreatmentEffectEvidence (T : TreatmentEffect) where
  confidenceIntervalValid : T.confidenceIntervalLower ≤ T.confidenceIntervalUpper
  pValueRange : 0 ≤ T.pValue ∧ T.pValue ≤ 1
  confidenceIntervalValidTerm : confidenceIntervalValid
  pValueRangeTerm : pValueRange

def TreatmentEffectSignificant (T : TreatmentEffect) : Prop :=
  T.pValue < 0.05 ∧ (T.confidenceIntervalLower > 0 ∨ T.confidenceIntervalUpper < 0)

theorem treatment_effect_significant_from_evidence (T : TreatmentEffect) (E : TreatmentEffectEvidence T) : TreatmentEffectSignificant T := by
  rcases E with ⟨hValid, hRange, _, _⟩
  rcases hRange with ⟨hpLow, hpHigh⟩
  have hpLT : T.pValue < 0.05 := by
    linarith
  have hOr : T.confidenceIntervalLower > 0 ∨ T.confidenceIntervalUpper < 0 := by
    by_cases h : T.confidenceIntervalLower > 0
    · left; exact h
    · right
      have : 0 < T.confidenceIntervalUpper := by
        have : T.confidenceIntervalLower ≤ T.confidenceIntervalUpper := hValid
        linarith
      linarith [h, hValid] 
  exact ⟨hpLT, hOr⟩

end ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean
end HautevilleHouse