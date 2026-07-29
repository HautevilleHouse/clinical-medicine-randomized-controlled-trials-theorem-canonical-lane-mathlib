import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean

structure SurvivalTimes where
  eventTimes : List ℝ
  censorTimes : List ℝ

structure SurvivalEvidence (S : SurvivalTimes) where
  timesFinite : ∀ t ∈ S.eventTimes, t ≠ 0
  censorFinite : ∀ t ∈ S.censorTimes, t ≠ 0
  timesFiniteTerm : timesFinite
  censorFiniteTerm : censorFinite

noncomputable def KaplanMeierEstimate (S : SurvivalTimes) : ℝ → ℝ :=
  λ t => 1

def SurvivalClosed (S : SurvivalTimes) : Prop :=
  S.eventTimes ≠ [] ∨ S.censorTimes ≠ []

theorem survival_closed_from_evidence (S : SurvivalTimes) (E : SurvivalEvidence S) : SurvivalClosed S := by
  unfold SurvivalClosed
  cases S.eventTimes with
  | nil =>
    cases S.censorTimes with
    | nil =>
      exfalso
      have h : ∀ t ∈ ([] : List ℝ), t ≠ 0 := λ _ h => by simp at h
      have hc := E.censorFiniteTerm
      have : S.censorTimes = [] := rfl
      have hc' : ∀ t ∈ S.censorTimes, t ≠ 0 := hc
      simpa [this] using hc'
    | cons _ _ =>
      right
      simp
  | cons _ _ =>
    left
    simp

end ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean
end HautevilleHouse