Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8DE356EA2F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2014 19:53:41 +0000 (UTC)
Received: by mail-yh0-f43.google.com with SMTP id b6so7459548yha.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2014 12:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=DRA/4W6ZBdGFH4xBQxG/lXowAAA7OgFae8lYM+QSQsE=;
	b=Q7JVUz+gPEa6joFYPt1f4s4ynP2jWGwm3vid8r/oaDhCPvnOFU14UxpP95roN12Oun
	/1AZ2XQ4WHpWhxQOnmn6ibF8uUCo/h+JOX5oZwk/N0qXaoeN1682bk7WjuvTVDi4O3kP
	EDXtBHZTXUD14U5fxUGzfTMDwNhCt6C14SVzbqn5bVPJIzghpUutUjE1fXbMp4t7+7i9
	7Ocr3iWvd33/+Sb3jzLwdoZcCC9YUaGIDC0YA1qMCzqeMCwdJlZ3pcbhJDW54GZYoaOZ
	1dRJo8C8weomk9GfY9WnrsbJv00OVmP/70LbrODoA5k9EEQ+KAIXnuFwHgUNyq+4Gpbz
	GWDw==
MIME-Version: 1.0
X-Received: by 10.236.40.12 with SMTP id e12mr3350139yhb.155.1395172421760;
	Tue, 18 Mar 2014 12:53:41 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Tue, 18 Mar 2014 12:53:41 -0700 (PDT)
In-Reply-To: <20140318191708.GD3725@jama>
References: <1395160103-15730-1-git-send-email-otavio@ossystems.com.br>
	<1395160103-15730-2-git-send-email-otavio@ossystems.com.br>
	<20140318190602.GB3725@jama> <20140318191708.GD3725@jama>
Date: Tue, 18 Mar 2014 16:53:41 -0300
X-Google-Sender-Auth: Kv2U_su9oT-a8xQB2JlisYJcYXE
Message-ID: <CAP9ODKo0KF851oDbQYKyu40dBMeR6k==EUgpWb7dCpNo9dJJtQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] libmicrohttpd: Update to 0.9.34
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
X-List-Received-Date: Tue, 18 Mar 2014 19:53:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Mar 18, 2014 at 4:17 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Mar 18, 2014 at 08:06:02PM +0100, Martin Jansa wrote:
>> On Tue, Mar 18, 2014 at 01:28:23PM -0300, Otavio Salvador wrote:
>> > This update fixes the following build error:
>> >
>> > ,----[ Build error ]
>> > | ...
>> > | .../libmicrospdy.so: undefined reference to `SSL_get_error'
>> > | .../libmicrospdy.so: undefined reference to `SSL_write'
>> > | .../libmicrospdy.so: undefined reference to `SSL_free'
>> > | ...
>> > `----
>>
>> Is this v2 or the same as previous update?
>
> Hmm it's identical, please don't resend identical changes and if you do
> it by accident, then please update status on patchwork.

My fault.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

