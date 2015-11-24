Return-Path: <mario.goulart@gmail.com>
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 75D4B6012C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2015 18:00:03 +0000 (UTC)
Received: by vkha189 with SMTP id a189so17265906vkh.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2015 10:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	bh=BbUEk7tXyCo6GBbEn5UpyelTDEalOEC5yi/ai0lpZ+4=;
	b=1DYsKyJMU3Np9XCeXq5GxPaKqwlXhsxyra4MP975ihwRMspsnJkkMUtj9lnOQW8pho
	D5FjHAG7NwhnAVyiJOUHsH1ZXMVGTOytsO8PZgP7namp+d7A1xGtqw5AbgslXlQBn1Nh
	/2JuoSfBYX3PWOuNpbQiBS/7FjNcPOrEkL7Tqrn3v5nBKB7p2WfJ+ngF4KiikHmcbt13
	dx3wO1g6vga2KMNDbk0aHtuTThAXzLMnsc8gia6IBg1lAOUPStae9XwE+VQZyPadH+D5
	EwHGb6g719JOOJE/7EmIzMY8XfsLDYi34tAMxvAbgWjXuHLM4k92Yr/Zum+XdCokBpNH
	Sxmg==
X-Received: by 10.31.166.201 with SMTP id p192mr28331253vke.53.1448388003711; 
	Tue, 24 Nov 2015 10:00:03 -0800 (PST)
Received: from email.parenteses.org.gmail.com (email.parenteses.org.
	[198.199.72.94]) by smtp.gmail.com with ESMTPSA id
	188sm15583811vki.27.2015.11.24.10.00.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Nov 2015 10:00:02 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: Tim Orling <ticotimo@gmail.com>
References: <1448367278-3115-1-git-send-email-mario@ossystems.com.br>
	<1448367278-3115-2-git-send-email-mario@ossystems.com.br>
	<CANx9H-At559xwpyM-qYch3qaUu2KK=4CDdAer8Byt1hkxeLk0A@mail.gmail.com>
Date: Tue, 24 Nov 2015 18:00:01 +0000
In-Reply-To: <CANx9H-At559xwpyM-qYch3qaUu2KK=4CDdAer8Byt1hkxeLk0A@mail.gmail.com>
	(Tim Orling's message of "Tue, 24 Nov 2015 09:56:51 -0800")
Message-ID: <87h9kbmg66.fsf@email.parenteses.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] python-chardet: add recipe for version 2.3.0
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
X-List-Received-Date: Tue, 24 Nov 2015 18:00:05 -0000
Content-Type: text/plain

On Tue, 24 Nov 2015 09:56:51 -0800 Tim Orling <ticotimo@gmail.com> wrote:

> This package has some unmet dependencies. Just a quick look at setup.py
> shows you will need python-re and  python-setuptools from oe-core.

Thanks for spotting that, Tim.  I'll work on an improved patch.

Best wishes.
Mario
-- 
http://www.ossystems.com.br

