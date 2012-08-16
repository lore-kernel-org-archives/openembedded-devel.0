Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T1rai-0000AI-EY
	for openembedded-devel@lists.linuxtogo.org;
	Thu, 16 Aug 2012 06:21:52 +0200
Received: by eekb57 with SMTP id b57so540299eek.6
	for <openembedded-devel@lists.linuxtogo.org>;
	Wed, 15 Aug 2012 21:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=MKb1Rm1DcEpDpO0hJ3qMa5g7iMMG5qFch8+m2+iNKpk=;
	b=amA3EjjpRHIevPNHbgfHSQhavSfYPGjCSrvSySFBDvRPaSmQVHuDAk74aYKRq5muRl
	PuNbYEnYSY0FMHK8vNMGfbRmaN6fXOfVarZ5bhfho4FryYDpt/NXuQ4IkOWq/jv7n/vI
	M0CImULzq/ukH8BvqQrqHeezXd7/fwuwHsZzDlnAafUg55s0h8UYcYlODQqkJHqCh55K
	Zqfp0LVpz7RFXJYN3r36oV9kzANiYtb/ONrrea6wdFmtTgdHZZKr1Pz3tJAjBmMUPc0j
	fTGWdpw/2s5Vt6Uoae3bmUV7y03lFjw3wXmpP7M98oiVwmwGPDXqUG/GomEvSizGDkoN
	EfVw==
Received: by 10.14.215.197 with SMTP id e45mr27087700eep.36.1345090195770;
	Wed, 15 Aug 2012 21:09:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.225.6 with HTTP; Wed, 15 Aug 2012 21:09:25 -0700 (PDT)
In-Reply-To: <CAP9ODKpUziM4W+UiK=da9UkO+UMA-wErx3QQCVM-Rbr7zx-XJQ@mail.gmail.com>
References: <1345031739-8374-1-git-send-email-paul.eggleton@linux.intel.com>
	<CAP9ODKpUziM4W+UiK=da9UkO+UMA-wErx3QQCVM-Rbr7zx-XJQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Aug 2012 21:09:25 -0700
Message-ID: <CAMKF1srS0y-TDqYJHq3jzoaz0nDmn-OP_F9R_bh5FptOzXCEvg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@lists.linuxtogo.org
Subject: Re: [meta-oe][PATCH] freerdp-extension-xpunlimited: inherit gitpkgv
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
X-List-Received-Date: Thu, 16 Aug 2012 04:21:52 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 15, 2012 at 10:48 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Wed, Aug 15, 2012 at 8:55 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>> If you refer to GITPKGVTAG you need to inherit gitpkgv or the result is
>> a parsing error.

since its not working and therefore carries no baggage lets try not
use GITPKGVTAG if possible ?


>>
>> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>
> Acked-by:       Otavio Salvador <otavio@ossystems.com.br>
>
> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


