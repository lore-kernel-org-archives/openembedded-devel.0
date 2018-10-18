Return-Path: <andre.draszik@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id EFD4B79C5C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2018 13:47:38 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id u34-v6so34243907qth.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2018 06:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ANINGvQiqdSmBO/zUr9rQ+Xxl3G++iB4nyT/hF7e5XY=;
	b=dtJe92cIEYHvx8NWS5AbrJNg8umsjVJyV11i2wVvOdv6EcKpAiJWEDwfhQodaYcVRO
	t3ANyKbNDSM1iyVyJdk7VJTNHTTQmvmxZCLFzZ7plQoXC8wUwqIdnE/ILyL8T3hVj6P8
	AqIom/1URvydP+5NnE5rOn8DuYGbiazQhOo47BQLISnuj6Cfao8zTJiHHBbZNItlrnFw
	Je1QIvrxcWB/J/M58uhVkW6jYyzV7XCEsVcy6cKnjLiL52nMgW3nv95mqkqU/BGejsZV
	bSxxrgE4zoD/6a52va1UvAn3rKxFdBaz4QLgX8lLYKt7+a0wYtQDpway7k1HWrfn+P+1
	Td5w==
X-Gm-Message-State: ABuFfojhcoHpOH7nenqTecfVdMX6LMyXp9T6FQFx0B+iw4JFLoEe9mIt
	l2/ibq5/QzgX+7owELf1dZ7JIVrx
X-Google-Smtp-Source: ACcGV61HbKU0kcseuaxalnDamOmU4YA3daQSrhRVoYETkKltjbemv9cNLPSPeV5UfzRBT1Fb+TRtMA==
X-Received: by 2002:a0c:819c:: with SMTP id 28mr30778218qvd.7.1539870459635;
	Thu, 18 Oct 2018 06:47:39 -0700 (PDT)
Received: from bluvision ([77.107.218.170]) by smtp.gmail.com with ESMTPSA id
	k39-v6sm1265382qtf.3.2018.10.18.06.47.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Oct 2018 06:47:38 -0700 (PDT)
Message-ID: <706876eeb67589b7a04d0243b91156ac480c6434.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org, Richard Leitner
	<richard.leitner@skidata.com>
Date: Thu, 18 Oct 2018 14:47:36 +0100
In-Reply-To: <20180925085538.24188-1-andreas.obergschwandtner@skidata.com>
References: <20180925085538.24188-1-andreas.obergschwandtner@skidata.com>
User-Agent: Evolution 3.30.1-1 
Mime-Version: 1.0
Subject: Re: [meta-java][PATCH] openjdk-8-native: hotspot: handle format-overflow error for gcc >= 7
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
X-List-Received-Date: Thu, 18 Oct 2018 13:47:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi (Richard),


On Tue, 2018-09-25 at 10:55 +0200, Andreas Obergschwandtner wrote:
> fixed the format-overflow warnings by patch affected files in
> openjdk-8-hotspot
> 
> Signed-off-by: Andreas Obergschwandtner <
> andreas.obergschwandtner@skidata.com>
> ---
>  .../hotspot-handle-gcc7-format-overflow.patch | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 recipes-core/openjdk/patches-openjdk-8/hotspot-handle-
> gcc7-format-overflow.patch

This patch seems to have been staged to master-next, but the patch is not
actually being used / referenced by the recipe.


Cheers,
Andre'



