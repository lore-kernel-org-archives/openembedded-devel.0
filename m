Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P4gVi-0005O5-00
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 22:59:18 +0200
Received: by iwn7 with SMTP id 7so1077801iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 13:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=/kp1h8HD+iVrNyjL06htHrG8YtqKIDTxnxCn+V1Vecg=;
	b=U/+Vg82WsUqmMOuIA/dOaeRYNRGgFl4tC3vRbMhWYoI1jQC3CWBfcA71fOtN4kmYV/
	l7oJ/rrcfDaCDgOOjkOBborPdy5cZZnhvbJC0mt0sGe/mv64qjUDfORGbXnZNY1aBruF
	f7W1bsK9egPm0zNg5zu9URctoHBykCjyHRNKI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=d0Ls830KHusfh74vTLnXBa6evQyQRn2rSXiO5a4zLGY9qlLos5TXvtpwP59rFjygRt
	Nu56E4KBVUWb1pFpEyLNTEOFKIh/Cfk+s6dBW3arOGh6+WEXwljezhT1q+nsZrxl0dlU
	4KtS1qgIM39Zjs+hfIy42Ev1+PRKKnlX4ZxJY=
MIME-Version: 1.0
Received: by 10.42.13.75 with SMTP id c11mr806944ica.481.1286657935434; Sat,
	09 Oct 2010 13:58:55 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 9 Oct 2010 13:58:55 -0700 (PDT)
In-Reply-To: <AANLkTimS+bg0XpWvAav0JX4qaf0b=CydG6_HQ0XHMo-h@mail.gmail.com>
References: <AANLkTik90dJxAJ_+GLQy+3MqP3oRFV9bYO6+BjSwZNkN@mail.gmail.com>
	<AANLkTimS+bg0XpWvAav0JX4qaf0b=CydG6_HQ0XHMo-h@mail.gmail.com>
Date: Sat, 9 Oct 2010 22:58:55 +0200
Message-ID: <AANLkTinQ4uW=o43O5Bv6FijfoicU2CL5j3Zn8zWf5Snm@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-08
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
X-List-Received-Date: Sat, 09 Oct 2010 20:59:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

libgee-native configure is failing:
http://tinderbox.openembedded.net/public/logs/task/8568667.txt


