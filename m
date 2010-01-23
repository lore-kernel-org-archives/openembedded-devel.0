Received: from mail-iw0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NYaM7-0001dO-4c
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 08:24:30 +0100
Received: by iwn5 with SMTP id 5so379078iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 23:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=kMbe7Dncs59zBl3PfU2ypiKfWS3VaGRXDEhrRActySY=;
	b=DWvUw7sc9vO6jZ82FLz3+fetQQpnNBIYwdIzvPg6ch0R4xf4921i9C91lCzlUp0x+3
	CqhGExAppTN8uwPp3mMIE8Rq4yVYqemPk1tzML47RSOebReHEX5/emhKX1Gj8e7E6Pbt
	okN6IP+uuCQHvCuBlUsLorYKVIAfgyLZMxaAY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=OOJjDLwSXboh8KWTtfeogVF8hFjBArmMEMF484w785KhoLwqhdV5pavEm0pXyAjLL/
	ouXbA9LkorB6MFPWo2Gjbkqtg8/fbxTXY10h1CHMkStqTjE+kdCkKXi5WhyiQ/hPssPx
	kiQGNRkP7U/IMiEza4kpKtNIkJTjKq20fQNfs=
MIME-Version: 1.0
Received: by 10.231.167.4 with SMTP id o4mr280906iby.66.1264231328181; Fri, 22 
	Jan 2010 23:22:08 -0800 (PST)
In-Reply-To: <4B55FC07.3080504@paulwilsonconsulting.com>
References: <1263888104.2678.15.camel@ubuntu-desktop>
	<1263888546.2678.17.camel@ubuntu-desktop>
	<4B55FC07.3080504@paulwilsonconsulting.com>
Date: Fri, 22 Jan 2010 23:22:08 -0800
Message-ID: <19c1b8a91001222322h78e8ad84r2f0ee43a3766aea5@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: git pull
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
X-List-Received-Date: Sat, 23 Jan 2010 07:24:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 19, 2010 at 10:37 AM, Paul Wilson
<paul@paulwilsonconsulting.com> wrote:
> I am having the same problem as Robin. Any suggestions?

read the wiki
http://wiki.openembedded.net/index.php/GitPhraseBook#Upgrading_your_data_.28lurking.29

>
> Paul
>
>
> On 19/01/2010 1:09 AM, robin wrote:
>>
>> One more input, When i use
>> git pull
>> Already up-to-date.
>>
>> and when i use
>> git pull --rebase
>> recipes/ti/ti-xdctools-native_3.15.01.59.bb: needs update
>> recipes/ti/ti-xdctools.inc: needs update
>> refusing to pull with rebase: your working tree is not up-to-date
>>
>> what is the correct command ?
>>
>> Robin
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


