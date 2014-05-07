Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id AA289601A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 03:35:12 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id rd18so441662iec.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 May 2014 20:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=h3jdeWrdyvpWQp+f4TwYVUEUZdklxSfk+gEMEsGgHBE=;
	b=LbRYG2P4/Fnp4csiGRjd29fpHMZMBBc3+i7xBXu9J3hpbshRPbikLH6rrdP9uZeya2
	UNexLxqS+WK93/HRDEgRpEdQp7iBr2VX8mo91a3JjNJJgfUprfi2vK6wOQgnoR4pkySm
	tPV0GQrJEKkQWD4IxuPIe0rXwfwvebKpMJhYMsA1fARHRVhiRD6UHgYDB98Xfk48vlfo
	fWrYdehrp9M4Nr/8wQ1GQfvENYMySrXwvaKNVz46NevAkjD2KZLMP4HfHaG6sfryOqGS
	Po6Dqd/xEuIrC8Oe9elXx8kV877lBl8zV/p4ELkgFogEGSnfK05pEC5mEZsG9Y3g5zjF
	j1Vg==
X-Gm-Message-State: ALoCoQkWveQfGnN/VtZbVsx4b3uRj/QRJzfir53qfVtwwkDdsVba0DsfOCgNwQ/Z6icEpgsZRwr1
X-Received: by 10.50.114.41 with SMTP id jd9mr37837665igb.33.1399433713577;
	Tue, 06 May 2014 20:35:13 -0700 (PDT)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158]) by mx.google.com with ESMTPSA id
	nj14sm1680947igb.18.2014.05.06.20.35.11 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 06 May 2014 20:35:12 -0700 (PDT)
Message-ID: <5369A9ED.4060506@linaro.org>
Date: Tue, 06 May 2014 23:35:09 -0400
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <5364B398.5000802@embed.me.uk>
	<CALmOhg=xAZehYF48AMcwX4Ugcpm4YE1yEdWH1+w9W0Y=TfDuew@mail.gmail.com>
	<1950582.OeVgyhOmPz@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <1950582.OeVgyhOmPz@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Website Text
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
X-List-Received-Date: Wed, 07 May 2014 03:35:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05/06/14 12:12, Paul Eggleton wrote:
> So I'd hope that the machine listing in the layer index could be made
> to help with that.

Absolutely, for raw recipe information or information on which MACHINEs
are supported the layer index would be a good choice.

But there's a fair amount of difference between "MACHINE, layer, and
recipe definitions" versus "here's the FSL community information, they
use repo, here's where they keep their manifests, here are the manifests
they have available, these are the boards they support, and here is how
you run their setup script".

Unless you're suggesting the layer index could also inform users of
manifests and setup script conventions?

