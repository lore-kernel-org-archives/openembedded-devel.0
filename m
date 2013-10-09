Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4CC606A463
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2013 20:50:23 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id i7so748896oag.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Oct 2013 13:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=uEMzX9L1J3LM03gQOcIdmxndhguFHgg5jbMnEUGoFiE=;
	b=UFNjVe2H8YSdpHLk4uVTuH+L5kSSm6LaXGmyLk8HHYGorXftMG3D3pLBNrch8ZjuMz
	CNqBAgq8n2TJKkD5UG26Tf+PSOefsTPoO14/tGSMNuOD5ShGR08feRTjYVMQDAqXUiuc
	yEBdzagORtnK+sZ35ukB6h9+37FxKTwcAvc2/yrVdXnk7sbLcVEEQ80PCruN7vQKCLjB
	16OqnIbVKjBm2d07LN9CN+eygMBFxIWb5lE6z20/YqyEpCan1189F5hl3WSvyfz555xX
	XSGca3gAtwZ0LKtQkwpZG+x9meI3PL0tkkY4QUKQGW+bKQoJjHeiPcdpWXNSi/UgJ4Pr
	syfg==
X-Gm-Message-State: ALoCoQm3oiqONik85JCqj/5KRKv6TxdS50uiH8ISiiM2miYrG6JTSQDFTeEQgQCs1RfvQOVvgFie
X-Received: by 10.60.145.207 with SMTP id sw15mr3294276oeb.38.1381351824883;
	Wed, 09 Oct 2013 13:50:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.108.113 with HTTP; Wed, 9 Oct 2013 13:50:03 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 9 Oct 2013 22:50:03 +0200
Message-ID: <CAP71WjwXX1MmRUzBa56oc6TENBNK18uA=pBUCNHDdT1+ZLViAg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-qt5] fontconfig
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
X-List-Received-Date: Wed, 09 Oct 2013 20:50:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

hi,

is there any specific reason why fontconfig is enabled by default in
meta-qt5/master (5.1) while it was disabled by default in
meta-qt5/dylan (5.0). It was explicitely disabled in dylan with this
patch:

http://patchwork.openembedded.org/patch/52343/

thanks

nicolas

