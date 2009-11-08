Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N78eN-0000Qh-Mc for openembedded-devel@lists.openembedded.org;
	Sun, 08 Nov 2009 15:21:54 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N78dA-0004En-Kd
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Nov 2009 15:20:36 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Nov 2009 15:20:36 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Nov 2009 15:20:36 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 08 Nov 2009 15:20:05 +0100
Message-ID: <hd6k2l$7lv$1@ger.gmane.org>
References: <ac9c93b10911061238p366f65edqeff04b25c872015f@mail.gmail.com>	<hd4qpq$ee0$1@ger.gmane.org>
	<1257682982.26962.14.camel@opal>	<hd6ggj$tf3$1@ger.gmane.org>
	<ac9c93b10911080608y6db44dache5b521eb64fafe2d@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <ac9c93b10911080608y6db44dache5b521eb64fafe2d@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: what to do with wrong checksum
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
X-List-Received-Date: Sun, 08 Nov 2009 14:21:55 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08-11-09 15:08, Frans Meulenbroeks wrote:
> Without making a comment on the commit message:
>
> As stated before the 3.33 version is clearly mentioned as "latest
> development version" on http://xmltwig.com/xmltwig/
> The last stable version is 3.32
> This project decided to provide snapshots (or whatever you want to
> call it) of the new version. In this case 3.33. Their choice.

3.33 is a version. A version is a point, not a distance. If it's a 
snapshot than you should call is twig-snapshot, twig-3.33rc1 or whatever.
Replacing a versioned tarball weekly is *bad*, since you (as upstream 
maintainer) don't know what the "3.33" is your users are complaining about.
And note that *nowhere* on that page it is stated that the development 
version keeps getting updated. And for that matter it also doesn't say 
3.32 is any better.

regards,

Koen



