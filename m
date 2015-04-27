Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 78C5173DA1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 17:18:36 +0000 (UTC)
Received: by iget9 with SMTP id t9so72748093ige.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 10:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=6e48jotutlhHSjejno7KacXR9Ys4mYMGdjRVKpZgPfY=;
	b=gsYqkueE93wt3LMVfDwEPFu2i60NqxoFvqeX+HVya66tPgHxH3RlkyOhXQlW1Dl+4w
	b4fM9xwv1qsQGdXmdz582QopZ+gmNH0RwCqnJC6NdAv6lxlBzVJAv1FO7gviqUEnbf4M
	EuLt/SbH0vhCSwHPIcJfupEuKEmp4gl7zVVc+PLjYKZKBcthiOghbhVErzmyco2LcmDq
	2ruk+mQUEmtzc91qIEfi1eWFDtfw3hulUfCiuNMQX47YmWvubHrG4pXlNQfoQUT2BtJw
	97AZ1EPAv47Zu0ZVtsfZzPvZp0WTCJMuppPeQjaBVke9ON362QJukouDrQ92GHEbaQ3O
	W89w==
MIME-Version: 1.0
X-Received: by 10.107.134.206 with SMTP id q75mr14958085ioi.27.1430155117639; 
	Mon, 27 Apr 2015 10:18:37 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.197 with HTTP; Mon, 27 Apr 2015 10:18:37 -0700 (PDT)
In-Reply-To: <94B898C6-986C-4533-9091-A7DE5BADA4E9@gmail.com>
References: <1430153054-1252-1-git-send-email-raj.khem@gmail.com>
	<1430153054-1252-2-git-send-email-raj.khem@gmail.com>
	<CAP9ODKpOaUqG+jFvraPe+aru=yPdDLZ_U6mqqxN7JnnmS4vSAw@mail.gmail.com>
	<94B898C6-986C-4533-9091-A7DE5BADA4E9@gmail.com>
Date: Mon, 27 Apr 2015 14:18:37 -0300
X-Google-Sender-Auth: DI7ghf9uy8fyWEedNHkbQu-_ypY
Message-ID: <CAP9ODKrRY5k43=BCawJq=ZTPKJdD3EvLCTeLo-0kz1Waed2FHA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH 2/2] chromium: Remove use of deprecated udev logging API
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
X-List-Received-Date: Mon, 27 Apr 2015 17:18:37 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 27, 2015 at 2:12 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Apr 27, 2015, at 9:53 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>
>> Agreed. Please add proper patch header and prepare a v2 please.
>>
>
> Can you point to patch header guidelines for meta-browser ?

Same as OE in general[1].

1. http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

