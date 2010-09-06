Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Osl6Y-00018K-R6
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 01:28:03 +0200
Received: by iwn2 with SMTP id 2so4624476iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 16:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=GfrSHLg9A6ac6lstH6LcdF7MotZ4Qdp9T0KN5AzCZyE=;
	b=mkuj/A0gt2UmD+vS98cRwpaijLoy1ZnPqreAul/3UzIzvYqGJkvO9hl0crdCwEG1yX
	/2rfaOIpt/myj8o4pEnbTf2L28Gc0m8hstyaNYNqLTN8YoSqN5ANsN5tR83ZRhlhEm1Y
	8MQn5HsCTzx1j2TTz+RUdAd0Te2TGQQJByZz8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=u5G3aegzIhgPMgQ/V/5qNGeHtdbrgcsbJFqUMAlTcbOoBq5GtLdPeTzcvk0NSFUJWW
	r8OzPHYaRSfIkHVhhUN0FHXGWXYQd+2nvYbflNrK1zuJ6r/9dVFeIvqQ0nIyYy2PUcmG
	UrQ802jXaxj+txLyt9X2W9yd/Kzcb+/bRNMDM=
MIME-Version: 1.0
Received: by 10.231.30.193 with SMTP id v1mr6938101ibc.87.1283815643798; Mon,
	06 Sep 2010 16:27:23 -0700 (PDT)
Received: by 10.231.167.79 with HTTP; Mon, 6 Sep 2010 16:27:23 -0700 (PDT)
In-Reply-To: <1283775540-13164-1-git-send-email-noor_ahsan@mentor.com>
References: <1283775540-13164-1-git-send-email-noor_ahsan@mentor.com>
Date: Tue, 7 Sep 2010 08:57:23 +0930
Message-ID: <AANLkTimjZwZ9TCLcWz3ZRQ2pGYj_nb=kE-qYtVW5uSBg@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libsdl-native: Convert to new style staging, remove do_stage
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
X-List-Received-Date: Mon, 06 Sep 2010 23:28:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 6 September 2010 21:49, Noor Ahsan <noor_ahsan@mentor.com> wrote:
> * Remove do_stage ()
> * Replace tabs with 8 spaces in do_configure

I see that spaces and not tabs are the OE policy, but I can't lay my
eyes on anything that says how many spaces are preferred. I see a lot
of recipes and examples using 4 space indentation (and most others use
a tab). Is this something that people care about?

-Graham

PS: Personally I'm a tab man, not a spaceman.


