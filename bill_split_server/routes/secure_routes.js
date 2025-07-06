import express from 'express';
import addFriends from '../controllers/addFriends.js';
import addGroup from '../controllers/addGroup.js';
import addMember from '../controllers/addMember.js';
import '../middleware/auth.js';
import getFriends from '../controllers/getFriends.js';
import getGroups from '../controllers/getGroups.js';
import addExpense from '../controllers/addExpense.js';
import getSplitExpense from '../controllers/getSplitExpense.js';
import getExpenses from '../controllers/getExpenses.js';

const router = express.Router();

router.get(
    '/friends',
    getFriends
);

router.post(
    '/friends/add',
    addFriends
);

router.get(
    '/groups',
    getGroups
);

router.post(
    '/groups/group/split-expense',
    getSplitExpense
);

router.post(
    '/groups/group/expenses',
    getExpenses
);

router.post(
    '/groups/add',
    addGroup
);

router.post(
    '/groups/members/add',
    addMember
);

router.post(
    '/groups/expense/add',
    addExpense
)

export default router;