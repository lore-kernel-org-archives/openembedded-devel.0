Received: from [74.125.44.155] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lamiaposta71@gmail.com>) id 1LtgnO-0007Z1-IG
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Apr 2009 13:27:25 +0200
Received: by yx-out-1718.google.com with SMTP id 3so1616311yxi.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Apr 2009 04:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=MBOrNsWPV5qNNlkoFBStBnvPn0vO+6uEIsYqeZgq8Ow=;
	b=kw+xvuPGUlhQEyNhgzLk+XUCZyL+G6td4ysSldTpMuk2BxMn03FRISACIEnLa3BNif
	x5e1P+SpmmQyxOFNwMdA/UZsIa9dl4avmLUWlNkQtzPgshfPBBLoCQxizsruAQYYXSLm
	fku+xvPYm8Oxx7oHI2ntWF96g15dvkSZOoPXs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=fXI2ClxxIjnUzSXIca2/PJGo7RL+tkQA5enrI77/QuRmP55Q1pfbSAqqyYGlKsrWWY
	voj+43CFPSczsXffjJ3BDUNTaefBD+I9Zrk6W26CAqpsc1xjvCt+n8j/VF6MByWOjNUN
	ZgbWj8vJQAe+VaXFjwQ7Rd1CwPoalM2DAc27U=
MIME-Version: 1.0
Received: by 10.231.35.66 with SMTP id o2mr1173865ibd.2.1239708217849; Tue, 14 
	Apr 2009 04:23:37 -0700 (PDT)
In-Reply-To: <gs1r3a$7ap$1@ger.gmane.org>
References: <ade1bdc0904140355i708b5842w1335cdcc53ad9707@mail.gmail.com>
	<ade1bdc0904140406y3fdb0e78g5b5a49638fb35606@mail.gmail.com>
	<gs1r3a$7ap$1@ger.gmane.org>
Date: Tue, 14 Apr 2009 13:23:37 +0200
Message-ID: <ade1bdc0904140423k6d62037ej54ea4d5c183ed604@mail.gmail.com>
From: Raffaele Recalcati <lamiaposta71@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.44.155
X-SA-Exim-Mail-From: lamiaposta71@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE] it is possible to add 600Mhz for kernel for beagleboard revB7 (OMAP3430 ES3.0) ?
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
X-List-Received-Date: Tue, 14 Apr 2009 11:27:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Yes, I now,
but I remember also that there was merging problems about something ...
If you think -pm kernel is stable as 2.6.28-r25 I use it, otherwise I
need to add this feature to 2.6.28-r25.
Thx


