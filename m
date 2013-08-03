Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 286C1608BF
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Aug 2013 17:50:24 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id eh20so3210170obb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Aug 2013 10:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=Vj2W+9dKgmuacoKE5ajJ9rFWKg98j38RqOARLy1ihgw=;
	b=WTjquvn5iAY4EGvUb1rlvt/Mo6JpCjEf1Qm+SWhLKR0B7/x5CZSGXlNig5nFoGfo3Y
	4kaO2Z3gX3cLaO3KXYYMbjkcUkem9n7ifiSFDRmQAaeByFR5KPU7DgJzAaRFrSVn47ii
	NDtmvbODao1R4yG8Tq7F+s8xngazuFtjCtTxwra4j7PltHprg5ucphtPejmyE1PuCBl4
	NEaknzxhQZsKd/SmYaELOzIt9uwFEXH0m1FgXGQzGIMXEtABZbTijgalLCvjs1+i5idS
	YKoxE94YYNnXxCVh8p/zIa0eJlC70AiFf4WDRcg+iINXJzMlnM3bFkNy6LOrjjGVVym6
	Q25Q==
MIME-Version: 1.0
X-Received: by 10.60.124.228 with SMTP id ml4mr2578823oeb.47.1375552224035;
	Sat, 03 Aug 2013 10:50:24 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Sat, 3 Aug 2013 10:50:23 -0700 (PDT)
In-Reply-To: <1375526327-16139-1-git-send-email-lpapp@kde.org>
References: <1375526327-16139-1-git-send-email-lpapp@kde.org>
Date: Sat, 3 Aug 2013 14:50:23 -0300
X-Google-Sender-Auth: cePT_N2HxlZUDd6UUPRj5Di-Xhk
Message-ID: <CAP9ODKrrK9w93N76hc3G9yw_6YkeaGKLy2iK-Z=V7smCRM=rWg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] Add QtSerialPort
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
X-List-Received-Date: Sat, 03 Aug 2013 17:50:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Aug 3, 2013 at 7:38 AM, Laszlo Papp <lpapp@kde.org> wrote:
> Signed-off-by: Laszlo Papp <lpapp@kde.org>

Please use the meta-qt5 prefix and rewrite the commit log as:

qtserialport: Add 5.1.0 version

We always put the recipe in question as this makes easier to find it later.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

