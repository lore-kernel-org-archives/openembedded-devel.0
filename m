Return-Path: <pauldotknopf@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9066D7757F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jun 2017 14:22:17 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id b6so91212392oia.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jun 2017 07:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=pna+IKrdXyjJhnoisX7cIctt/7LmsOEiQChIRrShi3g=;
	b=mtKPT8p6/L/pE52L5/W++CLdExg/kV+uao0O+sljalRyCg5B00kg+JDE6r/enxmhjs
	GLh8/vmIFCviu5xDIunSCdLc+WM9nLS8FEKvxgCBNHJFftMnn/smWd0ECF/jgmD8twcT
	q4xiZOjXYILKULUmb3NgRbj/DpUcYk61u0+k74c1hjR2FFP5PH5i06U1hhp9RVHBKja7
	yogmZxsDhVmdhNqdL8GORZlVaB3TqGhKffWZ/xEUS7l2VgJIIYB5QtRjB40ckNJa7xzw
	HerC3woOMXueqIHE5TdtIbYobgWVbX9ek1eGkCSeQt6+MyURbicW6FtilmysTdeXsPyf
	JQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=pna+IKrdXyjJhnoisX7cIctt/7LmsOEiQChIRrShi3g=;
	b=kzumDISJ433A3vMLRw+ffHRuFuplIhk4ZzB6c7zJjdGNPuX+jTqjh2MVkCe81VrB8v
	eCqWRiLoNYuaRFDMSCVATpm+f1WZe1xr2aAL5vIj91HhoGhGnoMPqvY5MHFtrnwX7Mwl
	73k4dDh3/pLr42/k5u9wypFQnJqWmMFbt9X+sAcyvswX0Ep9uaupyJ0XX9NJbieLMDbY
	k5vb+b5B71z0K1ixx7g4FvRQqGLPHGxyE1zLSm5DljtpSyDV9I3pRWUctoFk8jniWLzy
	ICh4bS3o5yBrjJcTUmcmiD85LhG226dltDtQLJ0H31z0NYP74T+XqJLfqxS9hUoYqO4/
	OA8Q==
X-Gm-Message-State: AKS2vOxN8ju63tJWxbshL/PScKEta6Q7F4yUAQraqh3FvZ0vpdSO4Ogb
	vg+/GAKO2uB03sQdoEjiy03UyV3MxQ==
X-Received: by 10.202.226.11 with SMTP id z11mr15609595oig.209.1498054938245; 
	Wed, 21 Jun 2017 07:22:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.139.150 with HTTP; Wed, 21 Jun 2017 07:22:17 -0700 (PDT)
From: Paul Knopf <pauldotknopf@gmail.com>
Date: Wed, 21 Jun 2017 10:22:17 -0400
Message-ID: <CAKmWj-1bxyR6gCMpOf+nQPvAWW2vz8dULDnL5DQ141OMcohF9A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: cflaat@medxchange.com
Subject: meta-qt5 pyro support?
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
X-List-Received-Date: Wed, 21 Jun 2017 14:22:18 -0000
Content-Type: text/plain; charset="UTF-8"

I notice there is no pyro branch for meta-qt5.

What is the status of this? ETA?

