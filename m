Return-Path: <brunovern.a@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4609C731F1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 12:51:30 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id oh2so272250799lbb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 04:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=gZGnC2NnlaeKLT4EBgF8dueTzzKPpQdyztbZX/fh30E=;
	b=yquYkrptgS8e/3O927zbloiIYiXrTnUOKSdg5lS6hwsv0pBjJts8ZKKySHnDCGwm3z
	XaT/OgENcdbzXtP59nwLG9A0g6aighBWFzLBpCXrSGHUhjGWRXKHhv2ABQHC8xhZ2EpM
	3mJTLpTFJi/1bA2UtP0GpJYwk1ynCAHqk5TiDhqqtStAtyQMBUmZzUaboE9c5Gccq10I
	UkMkAn1bJ1frOKCRlY/6WmpEAFrdkUuNM47PQdMCdyhCewXJmuPmvOSWLX7pdpw2NoUn
	nVOAXNufWTata90E2BFZrr7VlatjgdBPG++p0OwwcNYxg5vJgOlaK16IIChvNXU9mcJP
	5Bbw==
X-Received: by 10.112.184.133 with SMTP id eu5mr35466286lbc.99.1452603089299; 
	Tue, 12 Jan 2016 04:51:29 -0800 (PST)
MIME-Version: 1.0
From: Bruno Vernay <brunovern.a@gmail.com>
Date: Tue, 12 Jan 2016 12:51:19 +0000
Message-ID: <CAF3KAoQkwWWr=xfifeqP_bK25_ysY_7+B2h7xT6L9P1Pf34KhQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-oe] OpenLDAP modules
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jan 2016 12:51:33 -0000
Content-Type: text/plain; charset=UTF-8

Hi
It seems that OpenLDAP modules are build, but not all files are installed
on the target.
I created an issue in GitHub:
https://github.com/openembedded/meta-openembedded/issues/21

Also I could not find any example or documentation on how to use this
recipe (had to look at the code and trial and error). Is it the way to go
or is there a place to contribute examples at least?

Regards
Bruno

