Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 567726A4AC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2013 15:07:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6VF7jqS013881
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 31 Jul 2013 08:07:45 -0700 (PDT)
Received: from burninator.wrs.com (128.224.146.166) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 31 Jul 2013 08:07:45 -0700
From: Joe MacDonald <joe.macdonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 31 Jul 2013 11:07:38 -0400
Message-ID: <1375283260-22291-1-git-send-email-joe.macdonald@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: marcin.juszkiewicz@linaro.org, walters@verbum.org
Subject: (No subject)
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
X-List-Received-Date: Wed, 31 Jul 2013 15:07:46 -0000
Content-Type: text/plain

Forwarding a patch I received last week from Colin Walters.  Initially I
thought it was duplicating the patch for cyrus-sasl from Roy Li, but it
actaully seems to be solving a related problem that isn't quite the same.
If anything, it looks like perhaps the earlier change may make the thing
Colin was fixing more common.

-- 
-Joe MacDonald.
:wq


