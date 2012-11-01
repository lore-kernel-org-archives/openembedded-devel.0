Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TTsZ4-0005Ok-Hf
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Nov 2012 12:03:58 +0100
Received: from [10.155.1.52] (unknown [91.224.175.20])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 30153D22B6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Nov 2012 11:50:23 +0100 (CET)
Message-ID: <509253E9.7020306@linaro.org>
Date: Thu, 01 Nov 2012 11:50:17 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121010 Thunderbird/16.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAJTo0LYm7bwU0fNYcD8wQ3unJm_ShoW-ej5tZ3FeeogEztJGnQ@mail.gmail.com>
	<508AA6D5.1030009@linaro.org>
	<CAJTo0LYVC11crUCixSMz8tGrFuGXkoFG3Tsd1dHh+74ToTNMeQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYVC11crUCixSMz8tGrFuGXkoFG3Tsd1dHh+74ToTNMeQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 01 Nov 2012 11:03:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 31.10.2012 16:28, Burton, Ross pisze:
> Hi Marcin,
> 
> On 26 October 2012 16:05, Marcin Juszkiewicz 
> <marcin.juszkiewicz@linaro.org> wrote:
>> Are there chances that AArch64 related changes which are present in
>> master can get into danny? Everything other then gnu-config should
>> be safe and not affect other targets:
> 
> Adding a new architecture doesn't seem like a simple bug fix or 
> security problem, so I'm inclined to say no to this.

Thanks for answer. I understand your point and will adapt to it. We will
discuss future or our OE builds during next hour and will probably go with
one revision per week or something like that to minimize amount of
possible breakups.


