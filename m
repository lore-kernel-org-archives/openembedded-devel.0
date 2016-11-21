Return-Path: <rpjday@crashcourse.ca>
X-Greylist: delayed 598 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 21 Nov 2016 11:31:50 UTC
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 2AEBE719C1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 11:31:50 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20161121112151844_0485
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 11:21:51 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-devel@lists.openembedded.org>
Received: from [216.191.234.70] (port=26363 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c8mfR-0006h0-Sn for openembedded-devel@lists.openembedded.org;
	Mon, 21 Nov 2016 06:21:45 -0500
Date: Mon, 21 Nov 2016 06:20:39 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1611210619300.15332@ca624034.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: [PATCH][meta-oe][meta-perl] Correct typo, "libtap-parsser-result-bailout-perl"
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
X-List-Received-Date: Mon, 21 Nov 2016 11:31:52 -0000
Content-Type: text/plain; charset=US-ASCII


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.36.bb b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.36.bb
index 1aed5e0..9899bd6 100644
--- a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.36.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.36.bb
@@ -54,7 +54,7 @@ RPROVIDES_${PN} += "libapp-prove-perl \
                     libtap-parser-iteratorfactory-perl \
                     libtap-parser-multiplexer-perl \
                     libtap-parser-result-perl \
-                    libtap-parsser-result-bailout-perl \
+                    libtap-parser-result-bailout-perl \
                     libtap-parser-result-comment-perl \
                     libtap-parser-result-plan-perl \
                     libtap-parser-result-pragma-perl \

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


