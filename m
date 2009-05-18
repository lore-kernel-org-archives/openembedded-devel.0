Received: from [74.125.44.156] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M67Fs-0006NA-MI
	for openembedded-devel@openembedded.org; Mon, 18 May 2009 20:08:04 +0200
Received: by yx-out-1718.google.com with SMTP id 4so1772632yxp.30
	for <openembedded-devel@openembedded.org>;
	Mon, 18 May 2009 11:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=tOjIyqsCWcDMW6WmBCstxY9KfY2ZGirq6pHK7KS1Qxo=;
	b=LqXtL0IzP7yKWTFRvkSxZ19Guty/mq04F2Fu0WElddxjnpOuNYCpK0oQCmfGKEBz/p
	KjUERPXAzA17myEWwAeApC3S0LqndjUtQy3gUImmpH7KtYtjiAnR8zoEagKoBiI5ljWU
	QcL742rpYB6I3FozMxmeFAKTUymXJsKiZe2q4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=BJo7ApxSqlo3NZbUIC4JTHykgZsPeDfyugiuSWamEdOym45vwxYf4pGi8IGovMYVMC
	sxzjvOMa/4AR7K+1RQ/eOMXBCboL/k5dJgJmmcuoFIIzZJE4zBx3gSnAB/pTWO+1Rr70
	xPMf3WKiyS8/LkZvv0e0M2cYBueF38glZkUG4=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.151.8 with SMTP id y8mr9232531and.94.1242669647543; Mon, 
	18 May 2009 11:00:47 -0700 (PDT)
In-Reply-To: <guro0f$m4d$1@ger.gmane.org>
References: <gurn12$ifq$1@ger.gmane.org> <guro0f$m4d$1@ger.gmane.org>
Date: Mon, 18 May 2009 15:00:47 -0300
X-Google-Sender-Auth: 40f39371cc68377b
Message-ID: <be7a9f3d0905181100iea50047qeeef5fe3ded175e0@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFT] udev 141 for the unstable feed
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
X-List-Received-Date: Mon, 18 May 2009 18:08:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Koen,

On Mon, May 18, 2009 at 10:31 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> That should have gone to angstrom-devel, no oe-devel, sorry

After you complete it in angstrom mailing list would be nice to have
it fully working in dev and then merge it back to stable.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


