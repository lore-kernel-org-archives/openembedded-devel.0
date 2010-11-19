Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PJPzR-00089M-VS
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 13:22:59 +0100
Received: by iwn7 with SMTP id 7so10782iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 04:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=TOp3U3RCqVX+GBxExorfLh7kAPAZx5r9OIJCi+1G3Gc=;
	b=smPgTNq8yU03wp+rc7JbBhekIuUgeQeZ4HRuosjjzJkMzT5JCffnbosF0dRyPego0d
	wKVYWkksEDzw6ssYNfxhPiNHPqDuaFlH0Fongo0OPICICqnD6pn1sOvURHKMCNbhXR3U
	+Uc9hWwwF+saOrQQBaJLAnWfMsWzL23atKcLo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=F4TjnKKbFwpXlI3ODZYSwxuqjZ/TRjZYlPJSLN4BbyyOtmKEDCRXmq8sXa+oZ9IvFg
	TJPXC/eBJHo+6jvjhWsXG2fuRwcacQss1iZvd3PvfVJD3CsUk03MgrkD81JmnaUzHSUo
	aGu6W8Z61n2h3sNYMsq0DBxwKu2NwMSg6HfuQ=
MIME-Version: 1.0
Received: by 10.42.220.72 with SMTP id hx8mr237577icb.201.1290169302132; Fri,
	19 Nov 2010 04:21:42 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Fri, 19 Nov 2010 04:21:42 -0800 (PST)
In-Reply-To: <20101119112455.GB3411@jama>
References: <4CE64779.3020802@sensortherm.de>
	<AANLkTinAj4fG48Ppz_jwT1nmp+tzntZ9YJPaqat4HbES@mail.gmail.com>
	<20101119112455.GB3411@jama>
Date: Fri, 19 Nov 2010 13:21:42 +0100
Message-ID: <AANLkTin+qWWyqZ3a6gFn4n2cE5w4Zc8S_0QGOHDvyR3u@mail.gmail.com>
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
Subject: Re: buildserver
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
X-List-Received-Date: Fri, 19 Nov 2010 12:23:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/19 Martin Jansa <martin.jansa@gmail.com>:
> On Fri, Nov 19, 2010 at 01:42:27PM +0300, Yury Bushmelev wrote:
>> 2010/11/19 Klaus Schwarzkopf <schwarzkopf@sensortherm.de>:

>>
>> We have following number of distros, machines and images:
>> $ ls conf/distro/*.conf | wc -l
>> 32
>> $ ls conf/machine/*.conf | wc -l
>> 297
>> $ ls recipes/images/*.bb | wc -l
>> 99

Lots of these are stale/orphaned/unused/whatever.
For distro I made an overview last jul/aug. See ML archive.

frans


