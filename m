Return-Path: <mail@webthatworks.it>
Received: from smtp208.alice.it (smtp208.alice.it [82.57.200.104])
	by mail.openembedded.org (Postfix) with ESMTP id 8E720755F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 10:20:55 +0000 (UTC)
Received: from caronte.home.webthatworks.it (87.9.24.221) by smtp208.alice.it
	(8.6.060.28)
	id 55BB68E10E4AC40B for openembedded-devel@lists.openembedded.org;
	Wed, 28 Oct 2015 11:20:50 +0100
Received: from gloom.home.webthatworks.it (gloom.home.webthatworks.it
	[192.168.1.14])
	by caronte.home.webthatworks.it (Postfix) with ESMTP id 113946FE2318
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 11:20:50 +0100 (CET)
Received: from [IPv6:::1] (localhost [IPv6:::1])
	by gloom.home.webthatworks.it (Postfix) with ESMTP id CB2495E01D3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 11:20:48 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
References: <562EB36A.1010109@webthatworks.it>
	<CAP71WjyyrqEGtdfN1mzrwaH=YGAC4zdz5QwFH-aSxNzgXr=4JA@mail.gmail.com>
	<562F54BA.2070905@webthatworks.it> <20151027110541.GA2577@jama>
From: Ivan Sergio Borgonovo <mail@webthatworks.it>
Organization: http://www.WebThatWorks.it
Message-ID: <5630A180.1060609@webthatworks.it>
Date: Wed, 28 Oct 2015 11:20:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151027110541.GA2577@jama>
Subject: Re: checking if a patch was approved
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Oct 2015 10:20:59 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/2015 12:05 PM, Martin Jansa wrote:

> I've noticed second revision as well, it's in master-next, but it
> haven't finished even the automated jenkins build yet and because I
> don't use qt5 SDK I was hoping that someone else will review them as
> well. There are 2 formal issues, I've fixed commit message summary to
> match our guidelines:
> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

> But both are also missing SOB line, please confirm that I can add your
> SOB or resend both patches with SOB (and commit message from
> master-next).

Yes. Feel free to commit it. The changes are mine and the original file 
is under MIT license and the one below is my real name.

I'll try to be more strict about commit messages next time. The subject 
seemed so uncomfortably long.

Thanks

-- 
Ivan Sergio Borgonovo
http://www.webthatworks.it


