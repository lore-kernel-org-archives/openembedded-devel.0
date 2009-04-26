Received: from [209.85.198.246] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1LxwLr-0006E2-Rf
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Apr 2009 06:52:28 +0200
Received: by rv-out-0708.google.com with SMTP id f25so1287522rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Apr 2009 21:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=aiKwQE1NDI7bfqB8gejOpNoI0u2B3nuzxrsOx8VgcII=;
	b=QpJVfziJnzqjyIXgEKsPH3W61lMMys4RV4TrYxejNIj12K9OKszJs7kyeTmuZCoQlx
	uol+qdCTpiSDO3929wVk3Jf86trFecY1EEhs82h6D9/KzpDWmr/4V5tSB5KTuXPx48ES
	JYG90Rw4SA+G7N106sp0Oz4ScEPfALaI8vQkc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=UWcUp0zoQr03QQLpjMYib/ENJJPmrshpRl8gUaEmhGnt6fT1MiKck2UNukt97vtsE5
	OsVPsgYhkLyoQfRVOdqzNY3Rdi9dkMPYC+/qVN08kWZlIlpBW1cOK9AE1j7Bkr3NesFd
	KykJAJak9DuRMREIXIgfz7Jw0FS8PFJZvBhgQ=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.86.4 with SMTP id j4mr979149wfb.111.1240721253131; Sat, 25 
	Apr 2009 21:47:33 -0700 (PDT)
In-Reply-To: <20090426033218.GG28636@denix.org>
References: <200904252358.02016.marcin@juszkiewicz.com.pl>
	<b6ebd0a50904251916o501ae804vdb4008414cca6963@mail.gmail.com>
	<20090426033218.GG28636@denix.org>
Date: Sat, 25 Apr 2009 21:47:33 -0700
X-Google-Sender-Auth: 708b8e0ac21b4149
Message-ID: <b6ebd0a50904252147r73a49120p52ff7331fa9963d@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Removing GIT branches
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
X-List-Received-Date: Sun, 26 Apr 2009 04:52:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Ah, right, I stand corrected, then.

On Sat, Apr 25, 2009 at 8:32 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Sat, Apr 25, 2009 at 07:16:23PM -0700, Chris Larson wrote:
>> git push remotename :remotebranch
>>
>> You're pushing "nothing" (the left side of the : separator) to the
>> remote branch, which is removal.
>
> I thought there was a hook to prevent anybody from deleting arbitrary branches
> and only admins (Mickey) can remove branches...
>
>> On Sat, Apr 25, 2009 at 2:58 PM, Marcin Juszkiewicz
>> <marcin@juszkiewicz.com.pl> wrote:
>> >
>> > Hi
>> >
>> > Can someone remove hrw/poky-merge/add-rpm-packages-support and
>> > hrw/poky-rpm branches? They are obsolete now as code from them
>> > is merged into .dev already.
>
> --
> Denys
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


