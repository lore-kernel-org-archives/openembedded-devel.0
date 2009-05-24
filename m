Received: from [74.125.78.148] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hariseldon78@gmail.com>) id 1M8G1w-0000Hb-Mv
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 May 2009 17:54:32 +0200
Received: by ey-out-1920.google.com with SMTP id 26so1734938eyw.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 May 2009 08:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type;
	bh=MH4j41RVZ0QcGbkwGJPRzeu6TdpW3snNE2zx+vsSz4U=;
	b=TRys3m7omOMJH+PN9RVcSkaa2DjzCwnfqGqnGZ99D+JA9aOB427/inW1Bz6rqPbYLo
	653ktu3idoxbWDkfKWZAZ9pYY4Si2DyByqgak89LJAnSCelNSb1y7E+6o93zqS0PEUZ/
	bIzEBJZhVDTteovWAQH861X9JmYFCtvGluviA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=TJKhQv0CfQ8SOrkHh08nwhhe7yGEi3qDL4J6CSbRUrGzTEOcKrMOgFmk11pOzy3+DR
	Xc0d7GCh0B33PMw12tXyFO6InUNp8MSDl44FNV0VdTzj54KCtclqnSfZ9GVj0WaG9yXE
	R7ITPQdqG/i0O39D2WJTaS/MsqZUXB1IWMOQU=
MIME-Version: 1.0
Received: by 10.216.11.213 with SMTP id 63mr1173145wex.176.1243179998344; Sun, 
	24 May 2009 08:46:38 -0700 (PDT)
In-Reply-To: <gutp4q$bri$1@ger.gmane.org>
References: <aee831ab0905180656q31941a95jeedf18f65343c27f@mail.gmail.com>
	<gutp4q$bri$1@ger.gmane.org>
Date: Sun, 24 May 2009 17:46:38 +0200
Message-ID: <aee831ab0905240846q100b779eq69a4f110a5cb664d@mail.gmail.com>
From: roby <hariseldon78@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@openembedded.org
Subject: Re: asking for patch review
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
X-List-Received-Date: Sun, 24 May 2009 15:54:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Tue, May 19, 2009 at 10:03 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:

> On 18-05-09 15:56, Previdi Roberto wrote:
>
>> http://patchwork.openembedded.org/patch/433/
>> It's been queued since 20 days ago, and many more recent patches have
>>
> I just pushed the zenity 2.26.0 recipe I had lying around, could you base
> your patch on that version?
>

ok, i'll try, but i'm a bit disappointed.. why cannot the patch be applied
to the old version in the while?
and if i write another patch and it takes a month to be applied it's
possible that it will be old by that time, and another zenity version will
be there..
From what i see from oe-commit list my patch has been applied and then
reverted after some days.. why? is it invalid? maybe the patches for old
packages' versions are automatically considered invalid?
Anyway i don't want to start any flame, i'll try to port the patch to the
new version, i just feel there is something odd in this patch review
system..
-- 
roby

