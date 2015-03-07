Return-Path: <sadlife1990@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id DFD9F6013D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Mar 2015 09:59:51 +0000 (UTC)
Received: by wesu56 with SMTP id u56so64059795wes.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Mar 2015 01:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=b0bkoDr/mHO/EPzHsXANb1+AXbANRfuR4zi+owkkoIk=;
	b=BeVl8guu6st0zMafOd4cECQmglblvJJ+PYjPUp2Vyd0J53DS/HzbtDOnMsoCxNGoJU
	BNpYY/6E1XkMBzVFrguDtRqi2RuRtjCIDfQ6cJj1xt773v/8yC0aVPzlG1jKew3qpiEO
	musgsZnyaUNMeOhoizP6zLgpg1XTTAoFixbqSCil1W7xXsslmdiY4BMHzwt70QbzKNGc
	tJJsWEjdB9nyM7suSncCqjEx6IRWWsiKZrvixJPX1uy0+WhYysbvIodG10G8hPr4cgwD
	583UFlcmTGWDoevhJPM/paZZjNzmTMwOjubPXnNWxcXmQ0NH1rK+dOPBh71Rj6tFefyQ
	6wqg==
MIME-Version: 1.0
X-Received: by 10.194.134.169 with SMTP id pl9mr36294558wjb.67.1425722392769; 
	Sat, 07 Mar 2015 01:59:52 -0800 (PST)
Received: by 10.194.36.196 with HTTP; Sat, 7 Mar 2015 01:59:52 -0800 (PST)
Date: Sat, 7 Mar 2015 11:59:52 +0200
Message-ID: <CAAHuHfw4LNW-d7_rDKbGBwaMf-HKthMzO4f0AOY_4ZM3cy0SCw@mail.gmail.com>
From: Life Life <sadlife1990@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: ghostscript: build cups filters
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
X-List-Received-Date: Sat, 07 Mar 2015 09:59:55 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

I found this link, to build ghostscript cups filter but it's failed. Do you
have any idea ? I see error on this line
+RDEPENDS_${PN}-cups = ${PN}

https://git.congatec.com/yocto/poky/commit/b5ad3773afa99580f11292bcc730d355cae2e39a

