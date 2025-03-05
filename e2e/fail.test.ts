import { expect, test } from '@playwright/test';

test('new item is added', async ({ page }) => {
    const itemText = "test item";
    await page.goto('/');
    await page.locator('input').fill(itemText);
    await page.getByRole('button', { name: 'Add' }).click();
    await expect(page.getByRole('listitem')).toContainText("blabla");
});
