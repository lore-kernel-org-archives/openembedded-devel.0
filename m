Return-Path: <mhm.dawod@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 143B574CB4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 13:26:09 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id z74-v6so3583976qkb.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 06:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=p62lZBVoMawBH9k2snRK18g4QJ9u1vgNx+zKaAq/0WE=;
	b=Xqof/2v61QtFYU7DSBfo6DCRuq9Dh77x2ZRynv3Sx5MCuXwTbHH/eyRsrJVdMZRv9L
	4YtY7gIEgVQ/IgszkCwxl9J1/Ay8Pog0kbTjhmdNETMfy1KtpdkWRermVCVjNMGWP5k5
	0kbPayOnKHzjPsHyTuQGqXpI1Y0JlV4L3wrRQa7gb7HnMq64zHckd/+EvJXAyKgnSzVi
	tX8j3pZrLIb56IOXDZtEFJb8QKBYq4A7hxnomFUryCpLlgx1CzNacot1Mrx15PZZnoS5
	DHfyVcRG+1JODWRs8iJEb5HPpQ68Uy8J+Kay5D5kkbwBGL4bu046YA2b/rykUFl2z8/a
	EjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=p62lZBVoMawBH9k2snRK18g4QJ9u1vgNx+zKaAq/0WE=;
	b=lu1iQAmsYyqcXr0PD4Oz+jVEuIVNfxa7u6xByY9aAqciNJSGdJGHqbczMsk9KcraPN
	C/3yDkddRBj4jebMaC/6nZoHQS7AEMO/tgNmQfLsYZPDVspTEdonHz7Osr816ZLfBGK/
	3O7zI+CoqOhpeWTCi0ToNnsspuyM3pTHmMle3S2BL8ef4RRqSQ1XaBI9/TWeRh3UdWQx
	JGcjx748JZb9984DCx6QKT3GXTbaQfFG0NXb/aH2zEkVCh90hvJLsJ+0c3Bz6wOZ3ayK
	UApC4yd9Z/kLXI0u/H5cer149Xb1CEwThe5sN1EPXjcNEOp6d7eA2D2rb9MHcm2eyRdF
	AwZg==
X-Gm-Message-State: AOUpUlGMNVcoE4MitY4sXg72oi7sE/PCkZFU9LNqzsNw4NxwGO4og/PX
	sKXqAPtm0sK6NtFU2dLvrsB/oZWwIYBCjZNgrXNWYw==
X-Google-Smtp-Source: AA+uWPz8hRGHxUUPWlvRVig81ngagDZPLawKCxGDEzJi9Ja5K8aM0iHXUIA86xe6EU9UPsRM6wI6TmrKrnGIz8w44hE=
X-Received: by 2002:a0c:aa46:: with SMTP id
	e6-v6mr26674692qvb.50.1534425970775; 
	Thu, 16 Aug 2018 06:26:10 -0700 (PDT)
MIME-Version: 1.0
From: Mohamed Dawod <mhm.dawod@gmail.com>
Date: Thu, 16 Aug 2018 15:25:59 +0200
Message-ID: <CAGCTLNRr7118-2whFfsWw-KbaT23bCKmp4J-HmyBZMFWw750Bw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [qt5]: qt5 support
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
X-List-Received-Date: Thu, 16 Aug 2018 13:26:10 -0000
Content-Type: text/plain; charset="UTF-8"

can i run qt5 apps on image that support wayland weston without x11 ?
and how ?


-- 

Mohamed Dawod
Computer Engineering Department
Faculty of Engineering
Cairo University

