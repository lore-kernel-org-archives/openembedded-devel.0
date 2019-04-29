Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2F5887DD2C
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2019 18:07:48 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id c35so13060732qtk.3
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2019 11:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=FIQNl8XYiwfhfPtsyTjG+YrLGkL6NGm+VNhnIwkv32c=;
	b=mOKupnK91uwfCN1foyTFNMPa+tlMzfrtKFwwLKmF0g4W4GbNuo0dl8sMkSilPh46pU
	5CEBOH1VtdWWkFiclg1tajsR0trQYp3ie9Kj9mL5WBea8EwBcyaYKXxN4BLAR/ppNO0n
	lwBaVGAZHE3DDPhIJ5r3Cc9wXuXdWy9TEECYq7/i9HM7v/N8pDg5hSgl71ddyY0swAdm
	KNJR6buUSrc6IHarybkB54PGM7FtSfPPFWQ6l7eEugXgEMVopESGhBp8KGnqWynzjl72
	3eJ+moBLqxnLV8H+obo5xo+HB7nVNfkCPOLGf72VSvXb/Ov27yasVKD9W+D3+amjSSsY
	aUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=FIQNl8XYiwfhfPtsyTjG+YrLGkL6NGm+VNhnIwkv32c=;
	b=FGejMN9KQ6uhkJieM541TbKAVxkLXuIuvfIUvitJ81kdblgj3TbrrIJPbYsO5Pi6+d
	9qq1U77Ria7lAdt4G93fFG7c87Doxh6bbhmAqCQjmSZMEVs80equ/1j88xY6c7lqeWTV
	Xbo7cZe+gtMEVcTuWie9zUD8It/GrZyoan7THGo1htDOvw8NpNQZifTzQJ87dsVehazG
	mhddoesp1L3UX0w5jrH6YjY8QLauIHKzoWubrsgOC/UOzKIeY1xdYuxJa64OZ1bk/wDK
	GMNbhYAoWhcPWxnDqf0idJk5Y8F9JeZVgH73e6NYfOWVwDVmVn28FXcNLTqJp6MexkLt
	iRUw==
X-Gm-Message-State: APjAAAXNDhlSP9XV1XXCmLWbwbeEmNAdNnLm7at9W6pMLDOguznfgae7
	TizPJavhxjZ0/nXASLanw9vbkqHYXSIrxckxnw5Shy0H
X-Google-Smtp-Source: APXvYqzyGNe3J/uZmuAetFP7m5tRLVMYPlFq/pTEwPdsHixfWsvMil/el8kCCfYrPtpl0ock4bAWJxsQ73kOh9V7za0=
X-Received: by 2002:ac8:1489:: with SMTP id l9mr41748667qtj.236.1556561269564; 
	Mon, 29 Apr 2019 11:07:49 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Apr 2019 11:07:23 -0700
Message-ID: <CAMKF1srkU7OPqv7YRyGkrDHbmMMYR02hPpW_88cB_7=nYbrnZg@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: meta-openembedded 2.7 (warrior) release maintainer
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
X-List-Received-Date: Mon, 29 Apr 2019 18:07:49 -0000
Content-Type: text/plain; charset="UTF-8"

Hi

I have branched out warrior today and seeking a maintainer for warrior
release for all layers under meta-openembedded repository. If you have
time and interest please sign up to help out, much appreciated.

Thank you
-Khem

