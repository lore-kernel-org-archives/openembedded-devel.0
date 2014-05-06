Return-Path: <donald.poole@swri.org>
Received: from esg260-1.itc.swri.edu (esg260-1.itc.swri.edu [129.162.252.40])
	by mail.openembedded.org (Postfix) with ESMTP id 3346065EF4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 May 2014 18:35:10 +0000 (UTC)
Received: from victory-embedded-dev.dyn.datasys.swri.edu
	(victory-embedded-dev.dyn.datasys.swri.edu [129.162.107.136])
	(authenticated bits=0)
	by esg260-1.itc.swri.edu (8.14.5/8.14.5) with ESMTP id s46IZ5fK019102
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 6 May 2014 13:35:11 -0500
From: "Donald R. Poole, Jr." <donald.poole@swri.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 May 2014 13:34:23 -0500
Message-Id: <1399401265-29167-1-git-send-email-donald.poole@swri.org>
X-Mailer: git-send-email 1.7.9.5
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.11.96, 1.0.14,
	0.0.0000
	definitions=2014-05-06_06:2014-05-06, 2014-05-06,
	1970-01-01 signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=0
	kscore.is_bulkscore=1.24208421325989e-11 kscore.compositescore=1
	circleOfTrustscore=0 compositescore=0.997781753771917
	urlsuspect_oldscore=0.997781753771917 suspectscore=1
	recipient_domain_to_sender_totalscore=0 phishscore=0 bulkscore=0
	kscore.is_spamscore=0 recipient_to_sender_totalscore=0
	recipient_domain_to_sender_domain_totalscore=0
	rbsscore=0.997781753771917
	spamscore=0 recipient_to_sender_domain_totalscore=0 urlsuspectscore=0.9
	adultscore=0 classifier=spam adjust=-40 reason=mlx scancount=1
	engine=7.0.1-1402240000 definitions=main-1405060276
Subject: [meta-qt5][PATCH] qmake5_base.bbclass: Add install support for native builds
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 May 2014 18:35:12 -0000


Martin,
I have updated the patch per you last message and confirmed that it still works for my use-case.

