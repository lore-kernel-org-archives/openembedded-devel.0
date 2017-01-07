Return-Path: <armccurdy@gmail.com>
Received: from mail-wj0-f181.google.com (mail-wj0-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id ACD09606CB
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Jan 2017 04:13:35 +0000 (UTC)
Received: by mail-wj0-f181.google.com with SMTP id tn15so45281570wjb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jan 2017 20:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=T0COzcWMKCBql+OHqalWSHRhmILmqhlGy/4UpihE28I=;
	b=Oy1f4rbM/4gOIzUcoSxnV8Y+in4mNW4O4E+y6WwAts0Gd+9FwcsSxZarFNzvtAMowm
	wzgaj8e2ZkKTfP2FllkHWyKFekIYtHeucsEoy6oYt/s5/99X2Nh9L9uBGmd2KUV/JWlV
	kqgxcO6qnUKg+JB6lZbTLE9QQCtegQj/0s0zDDU4gDtikG/vLvZxp7xBIoDQCk3SCWLA
	SNG8NHwK+XUftCQTdpLFYEn2sb36Ms0Am1va8Yn0s+BK5oH/cKmFP8Y+ulAHYLteIRnt
	5sPwXQKEmFvcJDE4c5R62f0O21gURCyXzC/8oeDjOJxw2IEbfH4ybwF392ro45s6goAI
	iEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=T0COzcWMKCBql+OHqalWSHRhmILmqhlGy/4UpihE28I=;
	b=G3jseFBy9YP0pfCxs3UQ9pF+KcYU7rEunO88worWEPOznwRdaAwnhcI5QqX9AzijRP
	cXgla02KJurUCDxizPk9Vb6h8BJ6KXw0ERVPP1O1vuPz9SXKEuzquSUgEPGgN6YMWlb4
	8emjxlxNnoK5N1u1jyTQmIH73ZNLaAdUqBM1U2vf8GGfkr9Zym3pzGY/6sHKP0+M4Xpk
	oHLe/BBu6CeMzOCk6qy39rPkX2sMT/RsnhGsIpK5O8Oi6Dt3hMMXREWutqQQ55KcI28F
	gDlmgpULkEjacu6ONoIWtbqnSIh0CjS4DtOt+JWp+hQvWCivMeYnH8+2unvCXEY072O9
	+mzg==
X-Gm-Message-State: AIkVDXLF4EYePm447jZmQ9phc60POAeXWSyYJnC1qMWQMJoLiQrBhQ10NSwG9HD+OGXLTYvXi/O23aa9SgLL/A==
X-Received: by 10.194.115.226 with SMTP id jr2mr60553003wjb.75.1483762414467; 
	Fri, 06 Jan 2017 20:13:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.248.129 with HTTP; Fri, 6 Jan 2017 20:13:33 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 6 Jan 2017 20:13:33 -0800
Message-ID: <CAJ86T=WKT4CVhFh2s8cxNcqg4L6nhFTWxMnqaTLPh4M5b2TLYA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Testing meta-efl?
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
X-List-Received-Date: Sat, 07 Jan 2017 04:13:36 -0000
Content-Type: text/plain; charset=UTF-8

Is there a recommended image for testing changes/updates to efl?

