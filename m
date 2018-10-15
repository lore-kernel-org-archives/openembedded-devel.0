Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1D899797F3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 12:52:46 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id y11-v6so9262989plt.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 05:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=6yAdXvFuuQhpiRZwrGU7S/d1Gunm6WEZ2S5JkindHBk=;
	b=BOvoazcHNiRejfkX9m9G5DbycCCq2KyGO4Yy+JZiwGKWXo4eBjeBuAspgoMp0UwXJN
	rd2AECanQpAAaMKj0T0HUe2oA8e1KsxtLAWiaVGo6Clne91vmC34Va3GVJlZN63RQ9xn
	37pu+0W7aNyqAh+LzkFA0ZnXBKGevDPlwabQ+mt2hZlqaodM/IAYWRImDUR7gvAXMB5s
	jPMF+CcTB9N7UTpfuESzmNwmj4ZhVHyuKubWeM/9CH3qUALg5akrG9KxIej20p2FRB0Y
	gsMWLHQb7daUfZ88aaaLCAPpOuq14ekN5sTlzUm6HQYJ8OBomez5IGq1Y4q2CI5fkbOv
	6sXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=6yAdXvFuuQhpiRZwrGU7S/d1Gunm6WEZ2S5JkindHBk=;
	b=QByWL2G/FtOaMo27gJW8KOfnbAAq6ViX+JGuoBXgdI8VQpdJDi5RUyrczlOHSaI2wW
	L504Avz7KCvvU6fqoymrNz3daKnWoNQ08ZV2lSDbo41pfch2Uo0Oemzj/DCbAeRqhQO5
	uU2i1Cv2tpuZ7+tBEmjJwEiQcere3/rcqtJ3t1fl6O2aoWuz99bJKcQH2xfLZTjc+TnP
	MrQ4kNFyaDpbP+8QCpC7bsnGnEkv8nB88Y2O3tLthfOvoAlcVgdw04VMNCQZ1sfbAbl7
	DihQuk/aNHFM2bSzvVpmhS2yVqrlLxrA0cc5dgQEj3a/dihqD2B99KMMANDEPvwCuc8I
	aXBg==
X-Gm-Message-State: ABuFfohelfObP615lQFvADeOe6VWzH+oFBPwgNEFQ1xe5lBFLpAyrczm
	xdhj5jLfDafwwAr+aQ/B0l57ivw/dJw=
X-Google-Smtp-Source: ACcGV62TFScl4NBov8EvU4uo0KcjAyoX2MmF25guMZts3y+Nnx/fEwySoble8Gn+uKfnbABI3fHHiQ==
X-Received: by 2002:a17:902:8a8c:: with SMTP id
	p12-v6mr16995808plo.133.1539607966854; 
	Mon, 15 Oct 2018 05:52:46 -0700 (PDT)
Received: from ankit.iind.intel.com ([192.55.54.41])
	by smtp.gmail.com with ESMTPSA id
	p4-v6sm13629241pfg.188.2018.10.15.05.52.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Oct 2018 05:52:46 -0700 (PDT)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Oct 2018 18:19:20 +0530
Message-Id: <1539607760-20676-1-git-send-email-ankit.tarot@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] Khronos: Add Khronos LICENSE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Oct 2018 12:52:46 -0000

Suggested-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 meta-oe/licenses/Khronos | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-oe/licenses/Khronos

diff --git a/meta-oe/licenses/Khronos b/meta-oe/licenses/Khronos
new file mode 100644
index 0000000..7afedf6
--- /dev/null
+++ b/meta-oe/licenses/Khronos
@@ -0,0 +1,35 @@
+Copyright (c) 2016 The Khronos Group Inc.
+
+Permission is hereby granted, free of charge, to any person obtaining a copy
+of this software source and associated documentation files (the "Materials"),
+to deal in the Materials without restriction, including without limitation
+the rights to use, copy, modify, compile, merge, publish, distribute,
+sublicense, and/or sell copies of the Materials, and to permit persons to
+whom the Materials are furnished to do so, subject the following terms and
+conditions:
+
+All modifications to the Materials used to create a binary that is
+distributed to third parties shall be provided to Khronos with an
+unrestricted license to use for the purposes of implementing bug fixes and
+enhancements to the Materials;
+
+If the binary is used as part of an OpenCL(TM) implementation, whether binary
+is distributed together with or separately to that implementation, then
+recipient must become an OpenCL Adopter and follow the published OpenCL
+conformance process for that implementation, details at:
+http://www.khronos.org/conformance/;
+
+The above copyright notice, the OpenCL trademark license, and this permission
+notice shall be included in all copies or substantial portions of the
+Materials.
+
+THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+OUT OF OR IN CONNECTION WITH THE MATERIALS OR THE USE OR OTHER DEALINGS IN
+THE MATERIALS.
+
+OpenCL is a trademark of Apple Inc. used under license by Khronos.
+
-- 
1.9.1


