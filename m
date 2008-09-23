Received: from [72.14.220.159] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1KiFYz-00008P-9v
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Sep 2008 23:36:53 +0200
Received: by fg-out-1718.google.com with SMTP id l26so1969608fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2008 14:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=rozbA+zZU+Q9YPg/STC3I+8CxW9qaGJ18+ei+RZNW6M=;
	b=LRqbCwvQMX8czWrCGC4S0BhMAEw0uySLZzc8cXTsqK+KYih1Nt4qaWBFYEoJ8bWcfY
	L16N2uCIEqTNd9+Fnoscc8jub6JyCRNzPHCzROIka9ZVXUJDBWt9LQ63f3AHhpVbocIF
	KWyJcn4KGNZIXUOe8I7sZ+H70WZENmyaLjNoI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=c2Y5YJcop5cj61kCKjhpLZRfVH4rDwqBGtfNjNClGTVvoWFkMG95IFUsQj4/FKjg2L
	fYppt9CWT3cC9ftED1GCybiNxTJo2F/OAlrLKqDzluWt6MfoAU06DEX4cETe4I3kybnQ
	ofWSPH8AYVt1OI/DVMi2ArBwEJvG2PuFDtSTk=
Received: by 10.187.168.15 with SMTP id v15mr918781fao.100.1222205599243;
	Tue, 23 Sep 2008 14:33:19 -0700 (PDT)
Received: by 10.187.224.10 with HTTP; Tue, 23 Sep 2008 14:33:19 -0700 (PDT)
Message-ID: <d1b08f940809231433j6063c230wbd805140f40b69e@mail.gmail.com>
Date: Tue, 23 Sep 2008 23:33:19 +0200
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gbbmll$t6i$1@ger.gmane.org>
MIME-Version: 1.0
References: <20080923211433.GA29169@denix.org> <gbbmll$t6i$1@ger.gmane.org>
Subject: Re: libxml2_native_python_dir
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
X-List-Received-Date: Tue, 23 Sep 2008 21:36:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

talking with zecke I could easily develop a patch:

http://www.pastebin.ca/1209737

Seems to work here.Please test.

Andrea


