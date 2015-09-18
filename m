Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id EC05873243
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 18:46:35 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so23555907igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 11:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:date:message-id:subject:to
	:content-type;
	bh=pmCYTLB7SpdVynD3aigP12mUesopZ0es9BUgqRrWvbM=;
	b=h53Iq/FIANAW/b+eco4dIGfPWgdFvMANctSsPvunJalVwqGt5f9pSvnjqi31Ec21dK
	aiTybTyBYr8qq2PsHX28N6hN7jPVVYMTsdejexy25l9fb7A+IfqKsLSzjvtNm6uegSbH
	OzOlkjhrog9UfgsZ3oSFXEb+eMczWEbIf4BwmbVObKOG7tPmSEJIMNLnKNkG8HVXMMkt
	Cl4HpoSWfWrTmMkC2497UsXy2oi6QNVEyXyOmJ4csoNPTgdsG/tu+A/CFzbhfd/fYS6F
	WvVbgqxh9FvWKqNGwEcm1oKGHRw27g/DLuDaURpvWQy4+Z7nf4dw+q6sqRmbN5dk303b
	DEkA==
X-Gm-Message-State: ALoCoQmDMWyOeHByIxtuwUkGsaLL34jKlp0SCVkgNbXJhD+qLQK4bfKf6pTg5+n791vUCj0j9H5C
X-Received: by 10.50.138.72 with SMTP id qo8mr35955985igb.46.1442601994693;
	Fri, 18 Sep 2015 11:46:34 -0700 (PDT)
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com.
	[209.85.213.180])
	by smtp.gmail.com with ESMTPSA id u99sm4263266ioi.0.2015.09.18.11.46.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Sep 2015 11:46:33 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igcrk20 with SMTP id rk20so24339438igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 11:46:33 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.80.83 with SMTP id p19mr640887igx.5.1442601993034; Fri,
	18 Sep 2015 11:46:33 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Fri, 18 Sep 2015 11:46:30 -0700 (PDT)
Date: Fri, 18 Sep 2015 15:46:30 -0300
Message-ID: <CAP9ODKpEcL3=T-1Uvcty3z1x6+6JzTq-ww0wY+wAxNKTwC0Q7A@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Use of ConnMan to manage 3G connection
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
X-List-Received-Date: Fri, 18 Sep 2015 18:46:36 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

We are working in a project which we would like to use ConnMan to
manage the 3G connect. So far we had a hard time to get proper
examples of this working.

Does someone knows if it is indeed supported by ConnMan?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

