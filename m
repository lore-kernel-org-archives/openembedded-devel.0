Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot0-f180.google.com (mail-ot0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2624376024
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2018 12:07:19 +0000 (UTC)
Received: by mail-ot0-f180.google.com with SMTP id w13-v6so6952306ote.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2018 05:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tRab7YDqMDWZL2NnaJBoIRynpI7Q/ryX1IRG9d/JATw=;
	b=g4ITtogVUr2dqJvVUo/1aRa8onW8E7AM2TS1XrCBXh6h3StAN+tBAqaxmfgaU/31xg
	8uLJqJPbaYkgpo5X7fDnnzgT5aDlNKrSMK+8EOYtPVtAERIEMGn341xbPkiI4o6UH0bM
	FkLuUzGTbN4YQaP5s0INAQoYQVQnuKGds/aG8Q/fOPNRd1NDCtPJj8l53fOnObO/XZ+o
	zt2T+oS6XPz8pd8Nq505dtkTKH0RMk+fBNc+qyYThLhO6erpmwJ1BQNHknPcm63FK0pw
	Rb8N2KLy13eI2FgQBHoPrX+qAk0c5XfSayiqYndF9ePPwCH2cAKlJ04VyOu5p+Qri0lH
	1Tpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tRab7YDqMDWZL2NnaJBoIRynpI7Q/ryX1IRG9d/JATw=;
	b=OQxX0kK4Z4ooEBBikf7z+BLWa7PP/FZJI77V/hw6jHuIqbBElCq93GaeGNwGQAX9f1
	k7r7RPUacZPRnbbzDDhvEQOF5AlnxHMXIVHgeJQkeOUw0J3tCNbdJgXk7a/G8S/E7u5R
	kJrcbYMPYP91kjMG+iL0RtHNPdw9O+2/zVY/NWRnXPhgqqcFYI79z6fkKYokwr4tS/Vj
	2G6cESxnN4EwDShNIE7Dk6P/Le/gxBo3qBuUA6mxu8HoTHpNny49d8DPGK5rUoRP9H05
	AZrT/RfTz0ufP/po//W+/uMMvTlFhiIFU8JU4GY1Jufv/uFvHSCIaK2zrOeT67XZetvd
	yjUg==
X-Gm-Message-State: APt69E1I8Q5s9uVaC698FR8z8EI0r3kw361nPRNslB24jx/r8hsEGy60
	6UPg9d4+ae9ewFjg6jzrtw/hE77BylnG8Tlk8GY=
X-Google-Smtp-Source: ADUXVKJ3DJIe/N4VwArs9MdxkYirkr7KqkVFfKm0eqsLHprGLQ3JjKyAiR3FRd8LxA5B21DEKnIt98HhNYjlfUQkU8E=
X-Received: by 2002:aca:b01:: with SMTP id 1-v6mr1570469oil.285.1528286840942; 
	Wed, 06 Jun 2018 05:07:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:4916:0:0:0:0:0 with HTTP;
	Wed, 6 Jun 2018 05:07:20 -0700 (PDT)
In-Reply-To: <20180606105042.3676-1-nick83ola@gmail.com>
References: <20180606105042.3676-1-nick83ola@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 6 Jun 2018 14:07:20 +0200
Message-ID: <CALbNGRQn+JVd5PQVeQ6-eFvxqLzY=wHaL_0L+QQRx93RZdfHSg@mail.gmail.com>
To: Nicola Lunghi <nick83ola@gmail.com>
Cc: Nicola Lunghi <nicola.lunghi@jci.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] Add license file EPL-2.0
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
X-List-Received-Date: Wed, 06 Jun 2018 12:07:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 6, 2018 at 12:50 PM, Nicola Lunghi <nick83ola@gmail.com> wrote:
> From: Nicola Lunghi <nicola.lunghi@jci.com>
>
> it is from:
>
> https://www.eclipse.org/org/documents/epl-2.0/EPL-2.0.txt
>
> And add 'EPL-2.0' to SRC_DISTRIBUTE_LICENSES.
> ---
>  meta/conf/licenses.conf            |   2 +-
>  meta/files/common-licenses/EPL-2.0 | 277 +++++++++++++++++++++++++++++
>  2 files changed, 278 insertions(+), 1 deletion(-)
>  create mode 100644 meta/files/common-licenses/EPL-2.0
This should be send to openembedded-core@lists.openembedded.org

Andreas

