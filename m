Received: from [209.85.198.242] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <erik@hovland.org>) id 1LY6cI-0006mD-Kx
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 23:34:38 +0100
Received: by rv-out-0708.google.com with SMTP id b17so996192rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2009 14:33:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.141.197.21 with SMTP id z21mr1363501rvp.107.1234564389577; 
	Fri, 13 Feb 2009 14:33:09 -0800 (PST)
In-Reply-To: <4995CF5B.6080103@balister.org>
References: <4995BFE1.7090900@dls.net> <4995CF5B.6080103@balister.org>
Date: Fri, 13 Feb 2009 14:33:09 -0800
Message-ID: <a33aad7f0902131433u344f2965l8d04a3e4ea25b408@mail.gmail.com>
From: Erik Hovland <erik@hovland.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: boost-1.36.0 fails when compiling; cannot find the compiler
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
X-List-Received-Date: Fri, 13 Feb 2009 22:34:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

>> Boost 1.36.0 fails to build, do_compile log is below.  In a nutshell, it
>> seems to have lost the PATH variable.  The 1.33.1 version builds just
>> fine.
>>
>> The compiler is present.  The PATH is set correctly, it appears, from
>> the run.do_compile file.  So I can only presume that whatever "bjam" is,
>> its resetting the PATH or something.
>>
>> Nothing else has changed in the environment; 1.33.1 builds, 1.36.0
>> doesn't, and I have no idea what the heck this "bjam" stuff is or how to
>> debug it.
>>
>> Any suggestions?  Does this work for anyone else?
>
> It's been working on arm. And yes, the boost build system sucks :(

It sucks so bad that it probably has slowed adoption of boost in many
projects.

E

-- 
Erik Hovland
erik@hovland.org
http://hovland.org/


