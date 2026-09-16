# Visual evidence

A successful build is not proof that a visual change is correct.

Use this reference when layout, responsive behavior, typography, image placement, or visible states changed.

## Choose evidence proportional to the change

### Exact visual source exists

Render the changed area at the source viewport and compare the result with the source.

Inspect mismatches that affect composition, spacing, typography, assets, wrapping, crop, and visible state.

### Responsive behavior changed

Check the affected breakpoint or content threshold and at least one width/state on each side when the behavior can switch there.

### Local UI patch

Verify the changed component in its nearest real context. Do not create a cross-device screenshot suite for a one-line local fix.

## Preserve evidence selectively

Keep screenshots/diffs when they are useful for review or a risky visual regression. Disposable inspection is enough for trivial changes.

Do not let visual verification become a generic design audit outside the requested surface.
