Received: from [209.85.198.240] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Kq5j3-0005aN-9f
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Oct 2008 14:43:41 +0200
Received: by rv-out-0708.google.com with SMTP id f25so3114560rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Oct 2008 05:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=lEFUq6Zd0sLg0LbVMTSHqgoTj3G20vUfqlv6e932o3o=;
	b=N11D9+F+b+/i+ZeJ3pjYvR7eOPUcJrEqP8WO5yWCpAkd+euBSwJrh5UBt/V7vLKml6
	m+hFzWJZ7uAITwNrtSXmRMB0we4cNPX53oB4YCmE/iBY5W4rl/suavZGWJM4HDGmqyLa
	ui7AuY3b7LMAuJGPY/uJG50aKRKbTrmxJ9zuo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=iArx6aZpxpCUFtxF1IamRU8ofmF3bo6h1rs5AnjvwmWobE7K8hl9db4N+ctb7qKkV2
	XJwHvI8Ov1AnM8vMT15b7wXL5hDxYy7SD/ljSh2ZiY+CHMk9M/3XZD0To4jeOQdyJMcv
	0KJVL70J61ttB/hosCyNcK4Nyy1+LeyrG/3Es=
Received: by 10.140.203.9 with SMTP id a9mr558533rvg.203.1224074312099;
	Wed, 15 Oct 2008 05:38:32 -0700 (PDT)
Received: by 10.141.129.13 with HTTP; Wed, 15 Oct 2008 05:38:32 -0700 (PDT)
Message-ID: <f96d234e0810150538r5d922c4bp7acbeffcd74d8f7@mail.gmail.com>
Date: Wed, 15 Oct 2008 08:38:32 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <359c5480810150511y27819388ufd52ee31b900550e@mail.gmail.com>
MIME-Version: 1.0
References: <loom.20081015T114959-488@post.gmane.org>
	<359c5480810150511y27819388ufd52ee31b900550e@mail.gmail.com>
Subject: Re: GIT server down?
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
X-List-Received-Date: Wed, 15 Oct 2008 12:43:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Oct 15, 2008 at 8:11 AM, Nicola Mfb <nicola.mfb@gmail.com> wrote:
> 2008/10/15 Erland Lewin <erland@lewin.nu>
>
>> I'm having trouble using the git.openembedded.org server:
>>
>> erl@sol:~/src/oe$ git clone git://
>> git.openembedded.net/org.openembedded.dev
>> Initialized empty Git repository in
>> /home/erl/src/oe/org.openembedded.dev/.git/
>> fatal: The remote end hung up unexpectedly
>>
>
>
> I had the same problem, following the proposed instructions failed for me so
> I deleted the tree and recloned with:
> git clone git://git.openembedded.net/openembedded org.openembedded.dev
>
> But I'm absolutely not sure if this is correct!
> Someone may illume?

Yes, git://git.openembedded.net/openembedded is the correct repository.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


