Return-Path: <rapphil@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id AB69865C66
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 09:47:34 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id e89so656618qgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jan 2015 01:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=LIaF/mu2rU765cugj5xIMPnt3//vn+stT9cROg9ZSz8=;
	b=BbDLIdYNv0CcafzfdOWaOBrLRAICy3g8GMcj8MgPSTijObq3Qqx3HtIadtxYtKLIEP
	KXv//dtDA4FFhG7MADww6Vrt4PhjDiTLoI+P0dOnKbSASbC1q30/18GSAMZmgO1ZWnUp
	ojfccTBFXtNL02aVEuszj4WmH1yYj2deLeo7peRtKKJtyVbxsDmqgm1x7lNABvw0MLip
	anqbM97LMaEj4SzP7RM0SOhUTyWGykf6tWkngL2/uEJQEwZnMmXi3mWTxJe24+RCzomS
	X+/E1yhOaupYLRSB7Hjwr52qIJ/8HoDdF14hEX0VbyrDQtPkKbac3jRXrxbdmRTtpV67
	MCfA==
MIME-Version: 1.0
X-Received: by 10.229.130.65 with SMTP id r1mr3092347qcs.16.1420624055398;
	Wed, 07 Jan 2015 01:47:35 -0800 (PST)
Received: by 10.140.142.134 with HTTP; Wed, 7 Jan 2015 01:47:35 -0800 (PST)
Date: Wed, 7 Jan 2015 07:47:35 -0200
Message-ID: <CAENGNhdTiTo_xWs0uyLVWM6+A29xbF=4ROaxkN=fGkC+S97Zkw@mail.gmail.com>
From: Raphael Philipe <rapphil@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Soft66 repository
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
X-List-Received-Date: Wed, 07 Jan 2015 09:47:37 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I tried to remove soft66 from blacklist since libftdi was updated.
However, I was not able to download it from the repository. Soft66
failed in the do_fetch.

Does someone know if Soft66 is still mantained?

Regards,

