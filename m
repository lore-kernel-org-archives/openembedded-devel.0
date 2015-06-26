Return-Path: <h4nn35.work@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 494A1607BB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jun 2015 08:55:06 +0000 (UTC)
Received: by wgjx7 with SMTP id x7so9497604wgj.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jun 2015 01:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=C9QdGKJmZK+Cj4xbW97H65hVe1yazl5u/mX9VOJ+BnY=;
	b=k0VCHOAth9KqtHD6NLva1BpDOkZi/RpdzGdSapC18eCbhwq7cjxujh8Xz2vBxfI02l
	u/kSFIGGT2gQboS/oWy+kGLNizTl5pOPOSVkaJ+JkKXAlQfRlm0+OkiQDVmMlUvys/mm
	tWlKalGBojXSIGhGTsqPiscUZDZMH4tjdnoYY2zKZJAOw4zN91bqwrmMfWC3Y1nhO8jb
	xjECJpqivhp/VmMzICyzzbNZI3xHSq5b1I4O/GupC+cHie8I6luEX0NIWDSqHMwo0rCY
	20RILcNHoY1yS/qPDGNQud6B8nFxZdU1hjcMIQo6d63Ck97zNSf6vlbN1qDgrx2O2dYH
	Witw==
MIME-Version: 1.0
X-Received: by 10.194.93.198 with SMTP id cw6mr1006829wjb.113.1435308907296;
	Fri, 26 Jun 2015 01:55:07 -0700 (PDT)
Received: by 10.27.128.68 with HTTP; Fri, 26 Jun 2015 01:55:07 -0700 (PDT)
Date: Fri, 26 Jun 2015 10:55:07 +0200
Message-ID: <CAHvQdo0+mDR0Gq8DuuMgCp3j40ALA3T5xOd=6E=85uXUWZtaaQ@mail.gmail.com>
From: Johannes Pointner <h4nn35.work@gmail.com>
To: martin.jansa@gmail.com, openembedded-devel@lists.openembedded.org
Subject: [meta-qt5] qt5.5 test with branch jansa/master-5.5
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
X-List-Received-Date: Fri, 26 Jun 2015 08:55:07 -0000
Content-Type: text/plain; charset=UTF-8

Hello Martin,

I discovered our qt5.5 branch and I am curious if it's useable to test
qt 5.5 rc?

Thx,
Hannes

