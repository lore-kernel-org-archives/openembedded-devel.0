Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OZt7p-00037d-MN
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Jul 2010 00:11:22 +0200
Received: by fxm12 with SMTP id 12so1377644fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 15:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=puaHHO84MoAeppDnmpI858OFd7DAlS+/zAipTFm9o40=;
	b=go84fmvPhUqZxErQVWuKG2L9sCL5KdPUuTKc6KmjS7Kz+aeLbRPoHXflThWuaOcB1t
	K/GWJoEulSvYJqU3t4ck2HR6zLqZRlfZhyxP372mXITmTXnv6z33JewG6ExwRzMo/9ZE
	gC5gRemzwFRZwY5H9E+uZyLctP0NJntq5wSzI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=ki5PP/gqRDjPJ3ie04mNkLBiCOOg27pV6R72gLKJZo7GyI/lHWAGA3pqeTNlK9xMcv
	qG0ZF4D240kUWNEvJufnLo3kL8xDoQIJt1xi+AIYlmyXUOXBYDZ1rep2oHZkso3IDpx9
	aexAo62Qd9mD7mTz5+2Y/Wt/yzdan/GcirhEw=
Received: by 10.223.119.136 with SMTP id z8mr1173986faq.63.1279318275353;
	Fri, 16 Jul 2010 15:11:15 -0700 (PDT)
Received: from s42.loc (85-127-92-50.dynamic.xdsl-line.inode.at [85.127.92.50])
	by mx.google.com with ESMTPS id k15sm918338fai.40.2010.07.16.15.11.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 16 Jul 2010 15:11:14 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OZt7Z-0002VV-A6; Sat, 17 Jul 2010 00:11:05 +0200
Date: Sat, 17 Jul 2010 00:11:05 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100716221105.GJ23169@mx.loc>
References: <1279316946-8901-1-git-send-email-rep.dot.nop@gmail.com>
	<1279317776.7632.15.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1279317776.7632.15.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][CFT 1/3] libmpc: bump version and cleanup staging
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
X-List-Received-Date: Fri, 16 Jul 2010 22:11:22 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Jul 17, 2010 at 12:02:56AM +0200, Paul Menzel wrote:
>Dear Bernhard,
>
>
>what does CFT stand for? »Call for tender« [1].

hehe, i ment Call For Testers :)

$ dict CFT
1 definition found

From V.E.R.A. -- Virtual Entity of Relevant Acronyms (June 2006) [vera]:

  CFT
         Call For Testers


