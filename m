Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TTaRG-0006iB-8X
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 16:42:45 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 31 Oct 2012 08:29:03 -0700
Received: by mail-oa0-f69.google.com with SMTP id j6so4745058oag.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2012 08:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=f/z90L0GP5nbvO3fGzQV1ZTMKCqvur/LziXwTWk2GKg=;
	b=QV5Ctc104GHHgHswM3aCi2p5oTio6fZVyv5Wst6HquPoAftGb3JOuHeOew1Yl4s1UH
	6zilOhH7V//eVTzOdCDyS8fhJew069IEwkGcxcpzvE7+U6SOcMOB30Mh9mSGhDddPQTC
	Jo9Bvj6lyA0EKQnvALZ00sg6AqhPjJEOa4i1qJJvznY4mB+hgY7l/Lry+rXODcspucEH
	Ae16C6QPLgAW4cT6R4EK0hKVVghbFPqzVeA5HvbNZqkAcNRQVbvDSuTQK6WYhnYwDE7P
	2H6kZuU8BQ7eh6hYjIS0Q0gjy5RuroESnqm5lJQUQZHa0xAawoGksApYZHUbKfO/sVMp
	yVSQ==
Received: by 10.42.65.6 with SMTP id j6mr32189293ici.2.1351697342822;
	Wed, 31 Oct 2012 08:29:02 -0700 (PDT)
Received: by 10.42.65.6 with SMTP id j6mr32189291ici.2.1351697342741; Wed, 31
	Oct 2012 08:29:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.68.41 with HTTP; Wed, 31 Oct 2012 08:28:42 -0700 (PDT)
In-Reply-To: <508AA6D5.1030009@linaro.org>
References: <CAJTo0LYm7bwU0fNYcD8wQ3unJm_ShoW-ej5tZ3FeeogEztJGnQ@mail.gmail.com>
	<508AA6D5.1030009@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 31 Oct 2012 15:28:42 +0000
Message-ID: <CAJTo0LYVC11crUCixSMz8tGrFuGXkoFG3Tsd1dHh+74ToTNMeQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmOos2AnHvvKF0DN7GgMbrevjkPW0fnXuREhFVqpthvA7hM58qxLocJTlGvTANM3HJ3xmXKgglCEwnqbT9DlVXZN/YQGFmIxciyG0w4U1R+RKh/BDzYxkJLIYa5fFJEhanmpdkuOzv2CMKEgGaRYySGSRX4aiB5ystcqvKYQTvsuYaYg93IbpXR3OvJnbQmQaSmQGb2
Subject: Re: Danny stable release branch
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
X-List-Received-Date: Wed, 31 Oct 2012 15:42:45 -0000
Content-Type: text/plain; charset=UTF-8

Hi Marcin,

On 26 October 2012 16:05, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
> Are there chances that AArch64 related changes which are present in
> master can get into danny? Everything other then gnu-config should be
> safe and not affect other targets:

Adding a new architecture doesn't seem like a simple bug fix or
security problem, so I'm inclined to say no to this.

Ross


