Received: from [209.85.198.249] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MY4rj-00009c-R2
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Aug 2009 23:14:44 +0200
Received: by rv-out-0708.google.com with SMTP id l33so1009978rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Aug 2009 13:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=S635yfkGLWnbgTVwmgC3COWmQCyPGal+a6ZGs/F7fxg=;
	b=DOP5JgO5Ul65yAakLfaOXhqLa086nxOdE40guMOyt/Q8D2DIvqQn/ke1i2+/Em/Qe/
	r7RzhBnPv/hk4CGodUMQ9uYIrB8e6DdyzlVEUwmvqOf1JN5fa7OyVTU5wH5VMj5ZUHQT
	Ge48PYZ1pMT+gCRT9d1ryOYHukHCjXK5ITDwA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=dv1ruoObTW40iWQ3HG7QJ7cUCcGWHhsf4OaEEPM6tiS9isWr2g9uoSTt6+prTgyLl6
	KJAXMCKwb5e6q4UotZwhZkIsIzovos0pLhXh57xCO7Aj78BvETnY/W5HFsvMGDXadN3i
	bZCXlPFGPim7wL05X7IA1QFyI1mwOYYd5zBW0=
Received: by 10.140.225.9 with SMTP id x9mr1658112rvg.175.1249333155248;
	Mon, 03 Aug 2009 13:59:15 -0700 (PDT)
Received: from gmail.com (adsl-71-146-25-49.dsl.pltn13.sbcglobal.net
	[71.146.25.49])
	by mx.google.com with ESMTPS id k37sm1362358rvb.2.2009.08.03.13.59.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 03 Aug 2009 13:59:14 -0700 (PDT)
Date: Mon, 3 Aug 2009 13:59:09 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090803205909.GA24609@gmail.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Subject: Renaming gcc 4.4.0 to 4.4.1
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
X-List-Received-Date: Mon, 03 Aug 2009 21:14:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

Now that gcc 4.4.1 is out I would like to add the recipe but if gcc
4.4.0 is not been used then I would prefer to move gcc 4.4.0 to 4.4.1 
and reduce a few recipes.

If no one objects I will go ahead with moving them next week

Thanks

-Khem




