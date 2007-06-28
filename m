Received: from [209.85.146.179] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <papercrane@gmail.com>) id 1I3vkL-0001Qi-Hg
	for openembedded-devel@openembedded.org; Thu, 28 Jun 2007 17:17:25 +0200
Received: by wa-out-1112.google.com with SMTP id v27so331436wah
	for <openembedded-devel@openembedded.org>;
	Thu, 28 Jun 2007 08:12:53 -0700 (PDT)
Received: by 10.114.56.1 with SMTP id e1mr1577869waa.1183043573647;
	Thu, 28 Jun 2007 08:12:53 -0700 (PDT)
Received: by 10.114.144.2 with HTTP; Thu, 28 Jun 2007 08:12:53 -0700 (PDT)
Message-ID: <432beae0706280812j5ca06d49w4e71768a57b36789@mail.gmail.com>
Date: Thu, 28 Jun 2007 08:12:53 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: koen@dominion.kabel.utwente.nl
In-Reply-To: <4683CF96.40005@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <E1I3v58-0000nG-7W@linuxtogo.org>
	<4683CF96.40005@dominion.kabel.utwente.nl>
Cc: openembedded-devel@openembedded.org, openembedded-commits@openembedded.org
Subject: Re: [oe-commits] org.oe.dev linux-rp-2.6.20: update sharpsl-rc patch to fix IRQ issues (bug 2555)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jun 2007 15:17:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 6/28/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Stanislav commit schreef:
> > linux-rp-2.6.20: update sharpsl-rc patch to fix IRQ issues (bug 2555)
>
> > +CONFIG_BT_HCIUSB_SCO=m
>
> It's a bluetooth remote instead of a wired one?

Sorry, missed that. I'll put that back.

-- 
Justin Patrin


