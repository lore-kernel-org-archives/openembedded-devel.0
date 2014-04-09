Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7A00765D01
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Apr 2014 17:50:48 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id wn1so3063031obc.39
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Apr 2014 10:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=e34m7tvt7tKeWT3Q1dna/19tFeiWLSrV8o9BzV9Xtaw=;
	b=QIkuEIQdVGFom5yvKfIzfSvV1SfKSwBJKxTvj8FL1AHZk5MJiG7YfwCe7qFtsdLDp5
	zXRmFnyzk6J9gB+ma/pi6eNSAMtpzJS4lXLYW3K6f/8edkK5gVirzYTJfg3CzHbUDCA0
	jyJOU2QY3XalycK7/F19RP47LBZGkblto2SYiHGI2iNFET3COq1ADdLTcOp38uH9rJjN
	iBh03KmJfWXs+wQbRt5WoLKh6yAWyYl5p927qzAM9g7YIDSjaErl66ZBNT8i5EAIhwXA
	EcS0f75zheFE7ZY8pziaamj4cA5Elorz6ZxS6VC5ufYYXLD6NvKt7Njc/+NuRWWKRaeD
	+0aQ==
X-Gm-Message-State: ALoCoQngbFuCDd5UnTsIJp701OzHvLi1RuQzXrtg2+uowOvnv9uLA/aIqH93OEMjnGTFP/nPeugQ
X-Received: by 10.60.51.227 with SMTP id n3mr9826123oeo.33.1397065849089;
	Wed, 09 Apr 2014 10:50:49 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id e8sm6611330oed.7.2014.04.09.10.50.48
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Apr 2014 10:50:48 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Apr 2014 13:50:32 -0400
Message-Id: <1397065832-31634-1-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: patches@linaro.org
Subject: [meta-oe][PATCH] licenses: add The Open Group Public License
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
X-List-Received-Date: Wed, 09 Apr 2014 17:50:50 -0000

This is the license used for the motif library.

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 meta-oe/licenses/OGPL | 104 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 meta-oe/licenses/OGPL

diff --git a/meta-oe/licenses/OGPL b/meta-oe/licenses/OGPL
new file mode 100644
index 0000000..bce3b71
--- /dev/null
+++ b/meta-oe/licenses/OGPL
@@ -0,0 +1,104 @@
+$TOG: COPYRIGHT.MOTIF /main/5 2000/04/10 12:00:00 $
+
+                            MOTIF 2.1.30
+                             Source Code
+                        MASTER COPYRIGHT NOTICE
+
+(c) Copyright 1989 - 1994, 1996 - 1999 The Open Group
+(c) Copyright 1987 - 1999 Hewlett-Packard Company
+(c) Copyright 1987 - 1999 Digital Equipment Corporation, Maynard, Mass.
+(c) Copyright 1988 Massachusetts Institute of Technology
+(c) Copyright 1988 Microsoft Corporation
+(c) Copyright 1990 Motorola Inc.
+(c) Copyright 1989 - 1994 Groupe Bull
+(c) Copyright 1991 Joseph Friedman
+(c) Copyright 1995 - 1999 International Business Machines Corp.
+(c) Copyright 1995 - 1999 Sun Microsystems, Inc.
+(c) Copyright 1995 - 1999 Santa Cruz Organization, Inc.
+(c) Copyright 1995, 1996 Fujitsu Limited
+(c) Copyright 1995, 1996 Hitachi, Ltd.
+
+
+ALL RIGHTS RESERVED
+
+This software is furnished under a license and may be used
+and copied only in accordance with the terms of such license and
+with the inclusion of this copyright notice. No title to and ownership
+of the software is hereby transferred.
+
+This software is subject to an open license. It may only be
+used on, with or for operating systems which are themselves open
+source systems. You must contact The Open Group for a license allowing
+distribution and sublicensing of this software on, with, or for
+operating systems which are not Open Source programs.
+
+See http://www.opengroup.org/openmotif/license for full
+details of the license agreement. Any use, reproduction, or
+distribution of the program constitutes recipient's acceptance of
+this agreement.
+
+THE OPEN GROUP AND ITS THIRD PARTY SUPPLIERS, ASSUME NO RESPONSIBILITY
+FOR THE USE OR INABILITY TO USE ANY OF ITS SOFTWARE.
+
+EXCEPT AS EXPRESSLY SET FORTH IN THIS AGREEMENT, THE PROGRAM IS
+PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
+KIND, EITHER EXPRESS OR IMPLIED INCLUDING, WITHOUT LIMITATION, ANY
+WARRANTIES OR CONDITIONS OF TITLE, NON-INFRINGEMENT, MERCHANTABILITY
+OR FITNESS FOR A PARTICULAR PURPOSE.
+
+EXCEPT AS EXPRESSLY SET FORTH IN THIS AGREEMENT, NEITHER RECIPIENT
+NOR ANY CONTRIBUTORS SHALL HAVE ANY LIABILITY FOR ANY DIRECT,
+INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+DAMAGES (INCLUDING WITHOUT LIMITATION LOST PROFITS), HOWEVER CAUSED
+AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
+LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
+ANY WAY OUT OF THE USE OR DISTRIBUTION OF THE PROGRAM OR THE
+EXERCISE OF ANY RIGHTS GRANTED HEREUNDER, EVEN IF ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGES.
+
+The information in this software is subject to change without
+notice and should not be construed as a commitment by The Open Group
+or its third party suppliers.
+
+Notice: Notwithstanding any other lease or license that may pertain to,
+or accompany the delivery of, this computer software, the rights of the
+Government regarding its use, reproduction and disclosure are as set
+forth in Section 52.227-19 of the FARS Computer Software-Restricted
+Rights clause.
+
+(c) Copyright 1990, 1991, 1992, 1993, 1994, 1996 Open Software
+Foundation, Inc.
+(c) Copyright 1996, 1997, 1998, 1999, 2000 The Open Group.
+Unpublished - all rights reserved under the Copyright laws of the United
+States.
+
+RESTRICTED RIGHTS NOTICE: Use, duplication, or disclosure by the
+Government is subject to the restrictions as set forth in subparagraph
+(c)(1)(ii) of the Rights in Technical Data and Computer Software clause
+at DFARS 52.227-7013.
+
+The Open Group LLC
+Apex Plaza, Forbury Road
+Reading, Berkshire,
+RG1 1AX, UK.
+
+RESTRICTED RIGHTS LEGEND: This computer software is submitted with
+"restricted rights." Use, duplication or disclosure is subject to the
+restrictions as set forth in NASA FAR SUP 18-52.227-79 (April 1985)
+"Commercial Computer Software- Restricted Rights (April 1985)." The
+Open Group, Apex Plaza, Forbury Road, Reading, Berkshire, RG1 1AX, UK.
+If the contract contains the Clause at 18-52.227-74 "Rights in Data
+General" then the "Alternate III" clause applies.
+
+(c) Copyright 1990, 1991, 1992, 1993, 1994, 1996 Open Software
+Foundation,Inc. ALL RIGHTS RESERVED
+(c) Copyright 1996, 1997, 1998, 1999, 2000 The Open Group. ALL RIGHTS
+RESERVED
+
+The Open Group, Open Software Foundation, OSF, OSF/Motif, and Motif are
+Trademarks of The Open Group
+DEC and DIGITAL are registered trademarks of Digital Equipment
+Corporation
+HP is a trademark of Hewlett-Packard Company
+X Window System is a trademark of the Massachusetts Institute of
+Technology
-- 
1.9.0


