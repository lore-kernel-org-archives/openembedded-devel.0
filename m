Return-Path: <akini@synapticon.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 67CDF6D885
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 15:36:56 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id w6so4758843lbh.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 07:36:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=dMtaucFlUDWreOLNUeCKzrI5p1islMrGSVQ04yq4WgQ=;
	b=hgtVVOOjrzY4hJdtWQh+vaZguQGNU4RX5Fsa8O3GZ79HDycVeHY4R7AGIcpxAZrJXT
	ZKGmsaIvBma5Cr/s5oOk1Nrl9lYlEObsfXKNaeO5LhulcVyywZUrTe/e4/9Wb471WAWr
	tWdkEudz1EfH74am/NxsJ10pJwkng6yfGSf9ZVHFqk00Y0cbv/WeUGftKef8rIkOY6AF
	aSLyeZjyu3M0p9jBoqeeufXp9MhiCZPdekCW3Tyz0he92nP+YOnVPo7Q2Q36xP6KG6LM
	mL9qu1mOGjygpw49R/NJWDTeirCZllLZPsJSj2PtHpOwQawvVqQOwkRebNUs0YnIQjCa
	2kow==
X-Gm-Message-State: ALoCoQm40JSloYc/vZYQSPDPhN51v+08F6kGjjXiJkxjjnd2xTogzg+Kik2IKt7wF7M0ymyY9jn/
MIME-Version: 1.0
X-Received: by 10.152.30.8 with SMTP id o8mr129204lah.54.1384270617677; Tue,
	12 Nov 2013 07:36:57 -0800 (PST)
Received: by 10.114.18.139 with HTTP; Tue, 12 Nov 2013 07:36:57 -0800 (PST)
Date: Tue, 12 Nov 2013 16:36:57 +0100
Message-ID: <CAKS01oniO3YHFg2CAarKKaXfkSXnkEhy_JCwZNobQGqcNdM=cw@mail.gmail.com>
From: Anup Kini <akini@synapticon.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: how to populate sysroot with dev packages.
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
X-List-Received-Date: Tue, 12 Nov 2013 15:36:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I am trying to build package-B which needs a few files from package-A-dev
How do i deploy/install package-A-dev in sysroot such that when i build
package-B it can access those files.

I know that i can install dev-pkgs in the image but i would like to know
how to deploy them in the sysroot.

-- 


*Anup Kini*Systems Engineer
*------------------------------*

*Synapticon*  |  Cyber-Physical System Solutions

Mobile:

Direct:

+49 151 / 638 646 73

+49 7335 / 186 999 21

Fax:
+49 7335 / 186 999 1






synapticon.com <http://www.synapticon.com/>  |
@synapticon_co<https://twitter.com/#!/synapticon_co>

Synapticon GmbH  |  Hohlbachweg 2  |  73344 Gruibingen, DE
Secretary +49 7335 / 186 999 0  |  General Manager: Nikolai Ensslen
Registry Court Ulm HRB 725114  |  USt-ID DE271647127

This message and any files transmitted with it are confidential and
intended
solely for the use of the individual or entity to whom they are addressed.
Please notify the sender immediately if you have received this e-mail by
mistake and delete it from your system.

