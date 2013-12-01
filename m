Return-Path: <cjb.sw.nospam@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5E832615AF
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Dec 2013 12:31:29 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g15so8058930eak.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Dec 2013 04:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:references:in-reply-to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding:thread-index
	:content-language:importance;
	bh=sdLy2QFAHjHQYnKVuSpTrCRdD5kiBkwZ5Loqu8M0tkQ=;
	b=jjG0IYp9Q+ib/AmnOhSrIi2mzOq7dTEriqgrYCbK+Graz+Iygbm5yBIcVmu7PJ8dkt
	/aWsRSfBw9Hnfn9T3Wz2yAJ9kjpWo14/NtUsx32XMAd7JChG8h82RzB6lABTh46Fa1f7
	3QfUxUpPyeLan1jeRG7VZXazvTlTuBjqNuJFJmfVN6F0mXbGifT7oprv+l84upAY5sNd
	y7th7k+QR7KAB3NRJ/C4q8dcPCUCA7I4vjvrhIO0s/4XPTm36XGITLMCaozGLgBwgfx3
	6TF/r52ZYIBz+xo8eDvoidCLCJawp9eK3YBeVo3KaYg3ANGalFy1+2rb0TSlIpQt8YdD
	YgPg==
X-Received: by 10.15.56.7 with SMTP id x7mr925297eew.43.1385901088080;
	Sun, 01 Dec 2013 04:31:28 -0800 (PST)
Received: from SIMONENB (adsl-ull-216-84.46-151.net24.it. [151.46.84.216])
	by mx.google.com with ESMTPSA id o1sm16840818eea.10.2013.12.01.04.31.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Dec 2013 04:31:27 -0800 (PST)
From: "Simone" <cjb.sw.nospam@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
References: <548EF836-E57E-42CC-8E0A-0D77045DE0AE@gmail.com>	<20131127214440.GR2870@jama>	<34764D13-4A13-431F-B39D-E1B61004BBE9@gmail.com>
	<CAP9ODKq8McmPkA1_P_xo4pJYF-gUU8FB3AZZMqr+LQH=D7SHhA@mail.gmail.com>
In-Reply-To: <CAP9ODKq8McmPkA1_P_xo4pJYF-gUU8FB3AZZMqr+LQH=D7SHhA@mail.gmail.com>
Date: Sun, 1 Dec 2013 13:31:24 +0100
Message-ID: <001701ceee91$423a03d0$c6ae0b70$@gmail.com>
MIME-Version: 1.0
X-Priority: 1 (Highest)
X-MSMail-Priority: High
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQHZdKVhVxVkB2XuyXA/xZKkLRZcFAHPjrsOAQtmNsUBieTV85oHEKQw
Importance: High
Subject: Re: Meta-qt5 sdk
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
X-List-Received-Date: Sun, 01 Dec 2013 12:31:30 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: it

Hello Otavio,
I already saw the link posted by Martin, but I really do not understand what
I have to do.
I tried to clone the url https://github.com/meta-qt5/meta-qt5.wiki.git which
I found on this webpage, but I got only some text files....
I didn't saw any recipes to clone.. surely it is due to my lack of
experience..

I would really appreciate if someone have a couple of minutes to explain
what are the first steps to build the SDK...

Thanks so much
Simone




-----Messaggio originale-----
Da: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] Per conto di
Otavio Salvador
Inviato: sabato 30 novembre 2013 23:30
A: OpenEmbedded Devel List
Oggetto: Re: [oe] Meta-qt5 sdk

On Thu, Nov 28, 2013 at 7:00 PM, Simone <cjb.sw.nospam@gmail.com> wrote:
> Hello Martin,
> Thank you for your reply!
> I want to test this sdk, but i don't know how to build it.
>
> What i have to bitbake?
> What does it produce? An installer?
> Gdb is included?

Please check the link Martin has post.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel


