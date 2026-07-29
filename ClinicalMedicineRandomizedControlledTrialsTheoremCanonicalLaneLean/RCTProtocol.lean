import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean

structure RCTProtocol where
  sampleSize : ℕ
  treatmentArm : ℕ → ℝ
  controlArm : ℕ → ℝ
  alphaLevel : ℝ

structure RCTEvidence (R : RCTProtocol) where
  sampleSizePositive : R.sampleSize > 0
  alphaLevelRange : R.alphaLevel ∈ Set.Ioo 0 1
  sampleSizePositiveTerm : sampleSizePositive
  alphaLevelRangeTerm : alphaLevelRange

def RCTValid (R : RCTProtocol) : Prop :=
  R.sampleSize > 0 ∧ 0 < R.alphaLevel ∧ R.alphaLevel < 1

theorem rct_valid_from_evidence (R : RCTProtocol) (E : RCTEvidence R) : RCTValid R := by
  exact ⟨E.sampleSizePositiveTerm, E.alphaLevelRangeTerm⟩

end ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean
end HautevilleHouse