Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 968786E8C7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2014 21:54:42 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id wn1so1086156obc.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2014 13:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=wsBRP1QWkPcY0L7iOuRWgDf9pF6aJDjL9+0K9FZria0=;
	b=F28nV+jLQ5SRGzeCIBntGlJqjZ1GyYuq4B3cl2PvOQYtm8Lk6KiobFOZ1lro26IPq6
	UTcMwNupS6lDHDkrDBSWaM4nDjw6+SgdLrwhHilzA6cQEpepof9OJDrfaNLZ6Ftzw54J
	b25LrsTNT2twiZoQU0I9dzI1vHWIavR8wFtkp8V2C5qZVhyINSsRRN+zZmHaP+M5ONvy
	5alHibtfBEoAYZ5rnNWrBchm6C/AWHkPHXk0KhY19KAOPqAkgoRXdS2UJ1oeFMXMStYY
	GQQDM4NSR+WHU3n8gtSmpwvWXqKo1f3XQ444YAPu7NZ02Lli1KKtD4VlNCS5JEFZvCoz
	Vctg==
MIME-Version: 1.0
X-Received: by 10.182.135.194 with SMTP id pu2mr2967594obb.38.1390946083470;
	Tue, 28 Jan 2014 13:54:43 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 28 Jan 2014 13:54:43 -0800 (PST)
In-Reply-To: <CAP9ODKpur=uXCNj7AxysK_2E4iJps7rp4qE37FoiwjOZEyCUzw@mail.gmail.com>
References: <1390944553-6780-1-git-send-email-obi@opendreambox.org>
	<CAP9ODKpur=uXCNj7AxysK_2E4iJps7rp4qE37FoiwjOZEyCUzw@mail.gmail.com>
Date: Tue, 28 Jan 2014 19:54:43 -0200
X-Google-Sender-Auth: 5zlMORrtu1gBxAn4wjdRcwtxthg
Message-ID: <CAP9ODKq9SMZpHb2BajVsJ0oHGsOTDW8ar1rHQF+Kp_ETpmnysA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][RFC PATCH] libconnman-qt5: libconnman-qt, Qt5 edition
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
X-List-Received-Date: Tue, 28 Jan 2014 21:54:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 28, 2014 at 7:53 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
...
>> 2.) Regarding OE_QMAKE_PATH_HEADERS: I stole this from maliit to fix a
>>     compiler error, but the same assignment is also present in qt5.inc.
>>     Shouldn't this rather be the default?
>
> I agree.

Martin point explains why we shouldn't do it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

