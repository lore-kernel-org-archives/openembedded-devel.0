Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id AB40176E04
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 18:08:29 +0000 (UTC)
Received: by igxx6 with SMTP id x6so1101712igx.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 11:08:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:date:message-id:subject:to:cc
	:content-type;
	bh=PP3hsGSgBRLeg7J9dW7XJo8XyQq1s0BKNbZ1vzSX5Bk=;
	b=SriKijHn29UG2fB3lYmpFwf2tidB+zlo4K9FnC3TIQPvgRCUt9xKxMKSX8MtOGlRwI
	A8gB94oVmAQ9f1JQNQ+VriCL98HqZ4gTpIBQoZEIA+CYguVZ7fjLrmuOdZgnvG+49oKa
	sV6BiL7S57VJEuvRukByQiAfIKnHHpKfXJhX3i7Eu8REzEWnVAz1vKJpyqk4bwfonYAl
	eD6m/vPOz1LcPa4ZwU8ZgXqbCvZ07f7e8/pmfaem9xFMWIJCDTT9+bB6PIJP7X4G/tdG
	MfHaXf2LBvAWzXGG0q58/VGN1K1ngKAPc7BMbAoJ4hJupffGxMbaE6KStBJ2U0SnnNrh
	5ZHw==
X-Gm-Message-State: ALoCoQl0I0GJf0dgci2Uo67Mex3nV4C1iZ0do0Ky//yWKvOMDRHyxJeVO9xCnbxseHu8HkHbOo7i
X-Received: by 10.50.92.69 with SMTP id ck5mr6926198igb.3.1442513309622;
	Thu, 17 Sep 2015 11:08:29 -0700 (PDT)
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com.
	[209.85.223.169])
	by smtp.gmail.com with ESMTPSA id vk8sm4672303igb.4.2015.09.17.11.08.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Sep 2015 11:08:28 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by ioii196 with SMTP id i196so31066175ioi.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 11:08:27 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.7.225 with SMTP id g94mr8878909ioi.28.1442513307852;
	Thu, 17 Sep 2015 11:08:27 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 17 Sep 2015 11:08:27 -0700 (PDT)
Date: Thu, 17 Sep 2015 15:08:27 -0300
Message-ID: <CAP9ODKpdOtyML72GCOjR5LmNn6KZCOwrGchwYSreqCEOzd15Yg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Fido backports
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
X-List-Received-Date: Thu, 17 Sep 2015 18:08:31 -0000
Content-Type: text/plain; charset=UTF-8

Hello Martin,
Hello Armin,

Please queue following backports for Fido:

# Fixes
6ea7ac01
607b114d

If noone has objections I would like to propose the backport of:

# Upgrade
2c57f950a

# New recipe
2315f412f6

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

