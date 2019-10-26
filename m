Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id EDEE67FC11
	for <Openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 08:43:21 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id l15so430557qtr.10
	for <Openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 01:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=iiWNu1pjBnAHcTg3wP4Pso4az11WFwppBBKM/7OuN5Q=;
	b=ZM8B1EKxiAmXNkVIGfVQpZmlMTySDkjD7Ih7zmp9YxVYg+ArLKdRwLeZiGZ+MlneXB
	PSFMuIK5iA+PRv9zh+nsALoQ+OU6M9s/NWkXQzqR/otRc+Ek4xd0zqM0V2ReoPnb9ra9
	cqm2jc04EHSuC5TiXZ+FdO1SOOgaYSvrzU1TZBq8OBo6ivYhF0l6kuvG0ybZo7eBVyJC
	R3fcSrr80ploJtAv4h0xej8eI0XV+kNs29t7EMC+PITiAwkyrTzbr6l0KY6ctDjq4lya
	FJhrTSzfvC9YW/Tzcq8yAZBCGc46FDwW1c9w3qNWGvpi7wtpXomgeeL064RWCU9iN9d5
	xgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=iiWNu1pjBnAHcTg3wP4Pso4az11WFwppBBKM/7OuN5Q=;
	b=SPPlYuv70p/TKcakayOSk0CBNPhII5xXI3FiyQI3wNAi8Qo598DIYxJr2ORXhjyK8Z
	ZTv7g+zakX08Cdsg4JfUnoEcO37xmTf8HFKAaGYHG1PKqh09DHk3PpG6rwamMdiiby/z
	P0QsaMhD6Kg/RXc7+iPycdAW4qfmfYJZtd5GCeZaGtfLjGSl7mqfmSkdqzLJVR9tb66c
	RGdOKy5a3RkweT5wtiCyaMhGKLK92fMt/vvazw6eq92vfasPwRmFMvr/UnWqB4dWZjJL
	lAJ97XpS38wX6HmtQylxt2u5fbRhHsF54PxhAE1MISrDFF1sjsOLREGN6uaYFhstYBkt
	AGBw==
X-Gm-Message-State: APjAAAUhm83SpMVC+5vvQrc0htK/jBlMFFn2B1IVi74mXSJohhflkwQC
	HgE4Y9rEd4Ll2B5GAoDyJYQOycwypPSvcN0jZmtYBBMfXMo=
X-Google-Smtp-Source: APXvYqx9i3ufWOQmzPPxUiN8zYbYBsozrwDr0y9mRupsKnTT4NmqCytGu6dvO4cPweLwpPDbqctM87iTP/t7Qy3bztM=
X-Received: by 2002:ac8:411b:: with SMTP id q27mr7682150qtl.53.1572079402385; 
	Sat, 26 Oct 2019 01:43:22 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Oct 2019 09:42:56 +0100
Message-ID: <CAMKF1srmXmw+HPsDvzcTRovE36OfcGsXW9vXmJ_WbMV8Zv2rxg@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Seeking volunteers for zeus release maintainer for meta-openembedded layers
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
X-List-Received-Date: Sat, 26 Oct 2019 08:43:22 -0000
Content-Type: text/plain; charset="UTF-8"

Hi All

We have branched out zeus/yocto-3.0 branch for all meta-openembedded
layers and currently
looking for some volunteers to chime in and help with maintaining zeus branch.

Thanks
-Khem

