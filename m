Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1SAFSo-00013Q-Je
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2012 07:56:06 +0100
Received: by bkcjg15 with SMTP id jg15so705013bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2012 23:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=CmKVgAAPjO4Kqu46fD5iIfnNfW0Hk11AWyS9JfypXZY=;
	b=a8L7YNJo0cxN/dKwnMEk9rh0OqTpak0lgKGt6/YYHsGv7JIhzypg8fvmtYzhnuuw2l
	RZeEDGAmWASBLY4pUV7KZMcA6t/HSzEV55QocPSBoqvosi3QjVPOvMWTMdFH5PEsH2bC
	buEEKPR+drYTrrU5B07p8ORFeEEM0ajTk7QKfZARsxBW5YXckEyv/dKICX+oSYmapx5l
	4ORxltEQ/paZetC/JB+UeG9jhrsDldgf9qsO1We2f2PSHWXsy37UOG+L5pYObeWGTT4l
	7+bMs+UziwLxGMftQwIP0SNrUyuTTu/qrGaTAlNRlBSYFYJLNFUjDuVcBXxJim3GRyij
	aW1w==
Received: by 10.204.155.83 with SMTP id r19mr1002660bkw.123.1332312431824;
	Tue, 20 Mar 2012 23:47:11 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id r14sm1362302bkv.11.2012.03.20.23.47.10
	(version=SSLv3 cipher=OTHER); Tue, 20 Mar 2012 23:47:10 -0700 (PDT)
Message-ID: <4F69796D.5040708@dresearch-fe.de>
Date: Wed, 21 Mar 2012 07:47:09 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: Tom Rini <tom.rini@gmail.com>
References: <4F61C54B.1000609@dresearch-fe.de>
	<4F66E4F2.2000909@dresearch-fe.de>
	<CA+M6bXmpiegfSspYOwybxKSLf4Ukg5tjRL4VR1aq8T4EFyaaRg@mail.gmail.com>
	<CACW_hTbMZ5R6VB_BChH+3rxx-tqV3jqxioX8Q5ZWsoiHJWZ=7w@mail.gmail.com>
	<20120319162122.GA19810@bill-the-cat>
	<4F682E0C.4030101@dresearch-fe.de>
	<CACW_hTZaNQSiUDPPC2VyDqzeBenFwyKXUT6uaqR96LooaNiDRg@mail.gmail.com>
	<CA+M6bXnkir38b07V+w5A8szcHDvOaNzQV7pe-FOVGULOwG+wwg@mail.gmail.com>
In-Reply-To: <CA+M6bXnkir38b07V+w5A8szcHDvOaNzQV7pe-FOVGULOwG+wwg@mail.gmail.com>
X-Enigmail-Version: 1.4
X-Gm-Message-State: ALoCoQlsoXKrGP7qQ+11J7HKpEybF6Cc8f5d6kBIX4CWlkH9KMhjfaYoNhgQhsjweyA6wIBrYnQm
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: libmatthew-java-0.7.1.tar.gz not fetchable
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
X-List-Received-Date: Wed, 21 Mar 2012 06:56:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2012 15:22, Tom Rini wrote:
> On Tue, Mar 20, 2012 at 12:42 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> 2012/3/20 Steffen Sledz <sledz@dresearch-fe.de>:
>>> On 19.03.2012 17:21, Tom Rini wrote:
>>>> On Mon, Mar 19, 2012 at 04:44:10PM +0100, Frans Meulenbroeks wrote:
>>>>> 2012/3/19 Tom Rini <tom.rini@gmail.com>:
>>>>>> On Mon, Mar 19, 2012 at 12:49 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
>>>>>>> On 15.03.2012 11:32, Steffen Sledz wrote:
>>>>>>>> libmatthew-java-0.7.1.tar.gz (used in 2011.03-maintenance branch) is no longer fetchable from it's original location (the maintainer provides the latests version only). And i did not found another reliable source.
>>>>>>>>
>>>>>>>> Can someone put the tarball into the OE and/or Angstrom mirrors?
>>>>>>>
>>>>>>> Ping!
>>>>>>
>>>>>> If someone points Khem at a copy, this can happen...
>>>>>>
>>>>>> --
>>>>> google is your friend
>>>>>
>>>>> http://pkgs.fedoraproject.org/repo/pkgs/libmatthew-java/libmatthew-java-0.7.1.tar.gz/6a4db221129f230c64a0f937d00bb703/libmatthew-java-0.7.1.tar.gz
>>>>>
>>>>> It might be useful to update the recipe itself as well.
>>>>> Furthermore we might consider running a fetchall and put all fetched
>>>>> on the mirror.
>>>>
>>>> Does pkgs.fedoraproject.org have a policy about forever, ala
>>>> snapshot.debian.org?  Otherwise, we're just making a problem for
>>>> ourselves in the future.  WRT an everything mirror, I think bandwidth
>>>> usage is a concern there, ala what I think happened with the angstrom
>>>> everything mirror.
>>
>> I don't know about the policy fedora has for retaining packages.
>> There might also be a copy on debian. Google gave a fair number of hits.
> 
> I see one under
> http://snapshot.debian.org/archive/debian/20110301/pool/main/libm/libmatthew-java/
> so a patch to switch to that would be good with me.

The file <http://snapshot.debian.org/archive/debian/20110228T220053Z/pool/main/libm/libmatthew-java/libmatthew-java_0.7.1.orig.tar.gz> does not seem to be the same file we're looking for. At least the checksums differ.

--------------------> snip <-------------------
> wget http://snapshot.debian.org/archive/debian/20110228T220053Z/pool/main/libm/libmatthew-java/libmatthew-java_0.7.1.orig.tar.gz
asking libproxy about url 'http://snapshot.debian.org/archive/debian/20110228T220053Z/pool/main/libm/libmatthew-java/libmatthew-java_0.7.1.orig.tar.gz'
libproxy suggest to use 'direct://'
--2012-03-21 07:41:30--  http://snapshot.debian.org/archive/debian/20110228T220053Z/pool/main/libm/libmatthew-java/libmatthew-java_0.7.1.orig.tar.gz
Resolving snapshot.debian.org (snapshot.debian.org)... 193.62.202.30, 206.12.19.150, 2607:f8f0:610:4000:1a1a:0:ce0c:1396, ...
Connecting to snapshot.debian.org (snapshot.debian.org)|193.62.202.30|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 38375 (37K) [application/x-tar]
Saving to: `libmatthew-java_0.7.1.orig.tar.gz'

100%[==================================================================================================================>] 38.375      --.-K/s   in 0,1s

2012-03-21 07:41:30 (330 KB/s) - `libmatthew-java_0.7.1.orig.tar.gz' saved [38375/38375]

> md5sum libmatthew-java_0.7.1.orig.tar.gz
d6145d37c6d289713d68c5745eab23af  libmatthew-java_0.7.1.orig.tar.gz

> grep md5 recipes/libmatthew/libmatthew_0.7.1.bb
SRC_URI[md5sum] = "6a4db221129f230c64a0f937d00bb703"
--------------------> snip <-------------------

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


