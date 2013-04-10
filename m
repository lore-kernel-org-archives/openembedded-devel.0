Received: from mail-vc0-f169.google.com ([209.85.220.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UPxML-0003gz-Op
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 17:54:56 +0200
Received: by mail-vc0-f169.google.com with SMTP id hx10so494552vcb.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 08:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=j0gvCGAhPneaeYWgOZVs18vI4n31pZxf4xs9hSRz7oE=;
	b=HKyHTX7Ape2Ehpt2DbKF2L4AH+XHiH2C2EYHVYdYNIkBfGNS/IWQ7pwccZvuvQG+SL
	V8JT2jd6j0ZDHDG7Dvhew6T0edsIMekh86pTInrzRQm8XvUop6USSlKxZPxZuzSrIdwP
	khaLtYmRFUrDICMpZ4XowBR8vZltcKIZIuKQXXs5S5H2kEQQTtcOULGAoK4BM5fqbcWu
	bx67uLR2LLCy/5ktJem5RNM3pBbGbWxh6Aqi5odedhcjaiC3GNaiG4oX27VF5Ty0p1Fu
	3x9ZVuOoqXZ7n+KjDOwieciQRCRmpL4Kba0Cefe24ADaF16pe2JkEjFjSIsaujB+WER2
	GlAg==
X-Received: by 10.58.15.193 with SMTP id z1mr1905465vec.40.1365608251748; Wed,
	10 Apr 2013 08:37:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Wed, 10 Apr 2013 08:37:11 -0700 (PDT)
In-Reply-To: <CAP71WjwrXC6BAyPred-K+c0kZc4aOaDD6Nd_9WC5kmrTv_Hqog@mail.gmail.com>
References: <1365604639-5235-1-git-send-email-ndec@linaro.org>
	<CAJTo0LYfznJ8DH_PEaBWRF4_KVP=FqVJe8E6uZfkVtN1MhXYKw@mail.gmail.com>
	<CAP71WjwrXC6BAyPred-K+c0kZc4aOaDD6Nd_9WC5kmrTv_Hqog@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Apr 2013 16:37:11 +0100
Message-ID: <CAJTo0LZXHJqCERBQ1m+tEPvkKh_g+zO005_q5y2Cf8JQkEpTbQ@mail.gmail.com>
To: Nicolas Dechesne <ndec@linaro.org>
X-Gm-Message-State: ALoCoQlVIIdAW0e84a2z0POOFB//dHAo+MjgEXiGm2ZbYJhRYYZ3HVu95wpG0e/htKQE/M9ImVhL
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][PATCH] gupnp: remove dependency on gnome-icon-theme
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Apr 2013 15:54:57 -0000
Content-Type: text/plain; charset=UTF-8

Hi Nicolas,

On 10 April 2013 16:14, Nicolas Dechesne <ndec@linaro.org> wrote:
> then, what I could do is a patch serie where patch 1/2 introduces the
> INC_PR with "r0", and patch 2/2 fixes gupnp and increments INC_PR to
> 'r1'.

Exactly that.

> also, is that worthwhile to add the INC_PR in all other recipes in the
> gupnp folder ? or just in gupnp recipe for now?

Do them all, might as well.

Ross


